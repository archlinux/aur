# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=lentilwars
pkgver=1.1.0
pkgrel=3
pkgdesc='2D "tabletop" multiplayer shooter game'
arch=('i686' 'x86_64')
url="http://lwars.sourceforge.net"
license=('GPL-2')
depends=('sdl_mixer' 'sdl_ttf' 'sdl_image' 'sdl_gfx')
makedepends=('fpc')
source=(http://sourceforge.net/projects/lwars/files/lwars/Lentilwars-${pkgver}/lentilwars_1_1_0_all.tar.gz/download lentilwars.desktop)
md5sums=('38700e51807f36edb17fba1ba262d926'
         'd397227c7509ecd07964b6c1313f1402')

build() {
mkdir -p ${pkgdir}/usr/bin
cd ${srcdir}/lentilwars_1_1_0
make
}

package() {
cd ${srcdir}/lentilwars_1_1_0
install -D -m755 ./lentilwars ${pkgdir}/usr/share/lentilwars/lentilwars
/bin/tar cf - data/ intl/ | ( cd ../../pkg/usr/share/lentilwars/; tar xfp - )
install -D -m644 README* config.xml $pkgdir/usr/share/lentilwars
install -D -m644 level*.xml $pkgdir/usr/share/lentilwars
ln -s /usr/share/lentilwars/lentilwars ${pkgdir}/usr/bin/lentilwars
install -D -m644 data/icon.xpm $pkgdir/usr/share/pixmaps/lentilwars.xpm && \
install -D -m644 $srcdir/lentilwars.desktop $pkgdir/usr/share/applications/lentilwars.desktop
}
