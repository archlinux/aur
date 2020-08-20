# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=etesync-git
_pkgname=etesync
pkgver=0.1.0.75
pkgrel=1
pkgdesc="EteSync C library"
arch=(x86_64)
url="https://github.com/etesync/etesync-rs"
license=('LGPL')
depends=('openssl')
makedepends=('cargo')
source=("${_pkgname}::git+https://github.com/etesync/etesync-rs.git")
sha512sums=('SKIP')
provides=(etesync)
conflicts=(etesync)

pkgver() {
	cd "$_pkgname"
	printf "0.1.0.%s" "$(git rev-list --count HEAD)"
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
