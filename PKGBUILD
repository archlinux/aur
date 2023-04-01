# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: SmackleFunky <smacklefunky@optusnet.com.au>

pkgname=ltris
pkgver=1.2.6
pkgrel=1
pkgdesc="A tetris clone where you have a bowl with blocks falling down"
arch=('x86_64')
url="http://lgames.sourceforge.net/index.php?project=LTris"
license=('GPL')
depends=('sdl_mixer')
backup=('var/games/ltris.hscr')
install=$pkgname.install
source=(https://downloads.sourceforge.net/lgames/$pkgname-$pkgver.tar.gz)
sha512sums=('360ff6a6e1fb39cc9b80aa65581b72792c71f513bcc57384db897809ee94ed7804a3de5ac972f63a421955a907374a9f4879a6311ffc77a3f2380bb4d2579e10')
b2sums=('29a283f16a8c0f06f5997741fe40aeb4e4509a91123b4620f5bc1d502354198cd260086aecc24536291297bc54cf7e6427d6df84402a47643971448880a0a955')

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
