# Maintainer: Gabriel Rasteli <archgabr@tutanota.com>
pkgname=glr-st-git
pkgver=0.8.r6.7df3c2e
pkgrel=1
pkgdesc="My personal build of st."
arch=(x86_64)
url="https://gitlab.com/glr01/glr-st.git"
license=('MIT')
depends=(ttf-hack)
makedepends=(git)
provides=(st)
conflicts=(st)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "0.8.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd glr-st
  make X11NC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd glr-st
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pgkname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pgkname}/README.md"
}
