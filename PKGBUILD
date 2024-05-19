# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=mrboom
pkgver=5.5
pkgrel=1
pkgdesc="Mr.Boom is a 8 players Bomberman clone"
arch=('any')
conflicts=('mrboom')
provides=('mrboom')
url="http://mrboom.mumblecore.org"
license=('GPL2')
makedepends=('git' 'libmodplug' 'sdl2')
depends=('sdl2_mixer' 'minizip')
source=("https://github.com/Javanaise/mrboom-libretro/releases/download/$pkgver/MrBoom-src-${pkgver}.tar.gz")
sha256sums=('c37c09c30662b17f1c7da337da1475f534674686ce78c7e15b603eeadc4498f0')

build() {
  cd "${srcdir}/MrBoom-src-${pkgver}"
  make PREFIX=/usr mrboom LIBSDL2=1
}

package() {
  cd "${srcdir}/MrBoom-src-${pkgver}"
  make PREFIX=/usr/share DESTDIR="${pkgdir}" install
  install -Dm755 "${pkgdir}/usr/share/bin/mrboom" "${pkgdir}/usr/bin/mrboom"
  rm -rf "${pkgdir}/usr/share/bin"
  install -Dm644 "${srcdir}/MrBoom-src-${pkgver}/Assets/${pkgname}.desktop" "${pkgdir}/usr/share/applications/mrboom.desktop"
  install -Dm644 "${srcdir}/MrBoom-src-${pkgver}/Assets/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/mrboom.png"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"

}

