# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=mrboom
pkgver=5.4
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
sha256sums=('5f8f612a850a184dc59f03bcc74e279b50bc027d8ca2d9a4927a4caaa570b93a')

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

