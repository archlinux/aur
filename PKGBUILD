# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rednukem-git
pkgver=1.01.r11519.gec8dccf1a
pkgrel=1
pkgdesc='Reverse-engineered port of Build games using EDuke32 engine technology and development principles'
arch=('i686' 'x86_64')
url='https://github.com/nukeykt/NBlood'
license=('GPL2' 'custom:BUILD')
provides=('rednukem')
depends=('sdl2_mixer' 'libvpx' 'gtk2')
makedepends=('mesa' 'glu' 'gendesk' 'imagemagick')
makedepends_i686=('nasm')
source=("rednukem::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd rednukem
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd rednukem
  make PACKAGE_REPOSITORY=1
}

package() {
  cd rednukem
  convert -verbose source/rr/rsrc/game_icon.ico rednukem.png
  gendesk -f -n --pkgname "rednukem" \
          --pkgdesc "${pkgdesc}" \
          --exec="rednukem" \
          --categories=Game\;Shooter \
          --icon rednukem
  install -d "${pkgdir}/usr/bin"
  install -m755 rednukem "${pkgdir}/usr/bin/"
  install -Dm644 package/common/buildlic.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 rednukem-10.png "${pkgdir}/usr/share/pixmaps/rednukem.png"
  install -Dm644 rednukem.desktop "${pkgdir}/usr/share/applications/rednukem.desktop"
}
# vim:set ts=2 sw=2 et: