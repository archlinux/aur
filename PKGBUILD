# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=etebase
_pkgname=${pkgname}
pkgver=0.1.1.r2.gdaea1e1
pkgrel=1
pkgdesc="Etebase C library"
arch=(x86_64)
url="https://github.com/etesync/libetebase"
license=('LGPL')
depends=('openssl')
makedepends=('cargo' 'git')
source=("${_pkgname}::git+https://github.com/etesync/libetebase.git")
sha512sums=('SKIP')

pkgver() {
   cd "$_pkgname"
   # cutting off 'v' prefix that presents in the git tag
   git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install

  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 README.md
}
