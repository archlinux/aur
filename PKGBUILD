# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=lentilwars
pkgver=1.1.1
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc='2D "tabletop" multiplayer shooter game'
arch=('i686' 'x86_64')
url="http://lwars.sourceforge.net"
license=('GPL')
depends=('sdl_mixer' 'sdl_ttf' 'sdl_image' 'sdl_gfx')
makedepends=('fpc')
source=("${pkgname}-${pkgver}.tar.gz"::http://sourceforge.net/projects/lwars/files/lwars/Lentilwars-${pkgver}/lentilwars_${_pkgver}_all.tar.gz/download
        lentilwars.desktop)
md5sums=('57be92090459d44c2dcf3b3734585a56'
         'd397227c7509ecd07964b6c1313f1402')

build() {
  cd ${srcdir}/lentilwars_${_pkgver}
  make
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cd ${srcdir}/lentilwars_${_pkgver}
  install -D -m755 ./lentilwars ${pkgdir}/usr/share/lentilwars/lentilwars
  tar cf - data/ intl/ | ( cd ${pkgdir}/usr/share/lentilwars/; tar xfp - )
  install -D -m644 README* config.xml $pkgdir/usr/share/lentilwars
  install -D -m644 level*.xml $pkgdir/usr/share/lentilwars
  ln -s /usr/share/lentilwars/lentilwars ${pkgdir}/usr/bin/lentilwars
  install -D -m644 data/icon.xpm $pkgdir/usr/share/pixmaps/lentilwars.xpm && \
  install -D -m644 $srcdir/lentilwars.desktop $pkgdir/usr/share/applications/lentilwars.desktop
}
