# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=python-etebase
_pkgname=${pkgname}
pkgver=0.31.2
pkgrel=1
pkgdesc="Etebase Python library"
arch=(x86_64)
url="https://github.com/etesync/etebase-py"
license=('BSD')
depends=('openssl' 'python-msgpack')
makedepends=('cargo' 'git' 'python-setuptools' 'python-setuptools-rust')
source=("${_pkgname}::git+https://github.com/etesync/etebase-py.git?tag=v$pkgver" "0001-Dynamically-link-against-libssl.patch")
sha512sums=('SKIP' 'SKIP')

prepare() {
	cd "$_pkgname"
    git apply ../0001-Dynamically-link-against-libssl.patch
}

build() {
  cd "${_pkgname}"

  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 README.md
}
