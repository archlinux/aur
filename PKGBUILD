# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=uxtank
pkgver=2.3
pkgrel=3
pkgdesc="tank game for Linux"
url="https://sites.google.com/site/uxtank/home"
arch=('i686' 'x86_64')
license=('GPL')
source=("http://sites.google.com/site/${pkgname}/${pkgname}${pkgver}.tgz" "uxtank.desktop")
depends=('sdl_mixer' 'gcc-libs' 'libxpm')
md5sums=('eadecd55b58ffb66db6543f282ecdb68' '313c689409fcd2f1093e5336f98c6960')

build() {
cd $srcdir/${pkgname}${pkgver}
sed -i '/^LIB=/s%.*%LIB=-L/usr/X11R6/lib -lXpm -lX11 -L/usr/lib -lSDL_mixer -lSDL%' Makefile
make
}

package() {
cd $srcdir/${pkgname}${pkgver}
make DESTDIR=${pkgdir} install
install -D -m644 $srcdir/${pkgname}${pkgver}/icons/uxtank.xpm $pkgdir/usr/share/pixmaps/uxtank.xpm
install -D -m644 $srcdir/uxtank.desktop $pkgdir/usr/share/applications/uxtank.desktop
}
