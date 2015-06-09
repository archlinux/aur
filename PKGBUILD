# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=penguin-command
pkgver=1.6.11
pkgrel=2
pkgdesc="A clone of the classic Missile Command game with improved graphics and sound"
arch=('i686' 'x86_64')
url="http://www.linux-games.com/penguin-command/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
md5sums=('4dcf0073d62f28e47af18a922a1badc3'
         'f7602eba82c14ddbeb76f7da89c78044')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install a desktop entry
  install -Dm644 data/gfx/20explo.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
