# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rednukem-git
pkgver=Betav6.r12.g20dbaa8
pkgrel=1
pkgdesc='Redneck Rampage and Duke Nukem 3D port based on EDuke32'
arch=('i686' 'x86_64')
url='https://github.com/nukeykt/NRedneck'
license=('GPL2' 'custom:BUILD SOURCE CODE LICENSE TERMS')
depends=('sdl2_mixer' 'libvpx' 'gtk2')
makedepends=('mesa' 'glu' 'gendesk' 'imagemagick')
makedepends_i686=('nasm')
install=rednukem.install
source=("rednukem::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/rednukem"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/rednukem"
  make PACKAGE_REPOSITORY=1
  convert -verbose source/rr/rsrc/game_icon.ico rednukem.png
  gendesk -f -n --pkgname "rednukem" --pkgdesc "${pkgdesc}" --exec="rednukem" --categories=Game\;Shooter --icon rednukem
}

package() {
  cd "${srcdir}/rednukem"
  install -d "${pkgdir}/usr/bin"
  install -m755 rednukem "${pkgdir}/usr/bin/"
  install -Dm644 "package/common/buildlic.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 rednukem-10.png "${pkgdir}/usr/share/pixmaps/rednukem.png"
  install -Dm644 "rednukem.desktop" "${pkgdir}/usr/share/applications/rednukem.desktop"
}
# vim:set ts=2 sw=2 et: