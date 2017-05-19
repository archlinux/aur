# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=rc
pkgname=${_pkgname}-rakitzis-git
pkgver=r511.250c8ad
pkgrel=2
pkgdesc="Independent re-implementation for Unix of the Plan 9 shell."
arch=('x86_64' 'i686')
url="https://github.com/rakitzis/rc"
license=('Custom:ISC')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}")
source=("git+https://github.com/rakitzis/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}
  install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et: