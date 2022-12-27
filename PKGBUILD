# Maintainer: Gabriel Rasteli <archgabr@tutanota.com>
pkgname=glr-dmenu-git
pkgver=5.2.r23.d22dfd4
pkgrel=1
pkgdesc="My personal build of dmenu."
arch=(x86_64)
url="https://gitlab.com/glr01/glr-dmenu.git"
license=('MIT')
depends=(ttf-hack)
makedepends=(git)
provides=(dmenu)
conflicts=(dmenu)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "5.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd glr-dmenu
  make X11NC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd glr-dmenu
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -rf * "${pkgdir}/opt/${pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
