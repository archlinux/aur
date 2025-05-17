# Maintainer: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: SmackleFunky <smacklefunky@optusnet.com.au>

pkgname=ltris
pkgver=1.3.2
pkgrel=1
pkgdesc="A tetris clone where you have a bowl with blocks falling down"
arch=('x86_64')
url="https://lgames.sourceforge.io/index.php?project=LTris"
license=('GPL')
depends=('sdl_mixer')
backup=('var/games/ltris.hscr')
install=$pkgname.install
source=(https://downloads.sourceforge.net/lgames/$pkgname-$pkgver.tar.gz)
sha256sums=('ff28c55a18c61f28a86ba7f30f13222dfed0f7fbeb492acd95c97de9c659cec9')

prepare() {
  cd $pkgname-$pkgver
  sed -e 's|-Wno-format||' -i configure
}

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr --localstatedir=/var/games
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/pixmaps
  install -m644 icons/ltris{16,32,48}.xpm "${pkgdir}"/usr/share/pixmaps
  #FS#37951 fix
  chmod 775 "${pkgdir}"/var/games
}
