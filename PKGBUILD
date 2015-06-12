# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=gcrontab
pkgver=0.8
pkgrel=3
pkgdesc="a crontab editor with GUI"
arch=('i686')
url="http://www.arquired.es/users/aldelgado/proy/gcrontab/"
license=('GPL')
depends=('gtk')
#source=("http://www.arquired.es/users/aldelgado/proy/${pkgname}/${pkgname}-${pkgver}.0.tgz" "gcrontab.desktop")
source=("http://web.archive.org/web/20120427151653/http://www.arquired.es/users/aldelgado/proy/gcrontab/gcrontab-0.8.0.tgz" "gcrontab.desktop")
md5sums=('acd0797153d3aabe2242cc4dd61b1787'
         '3d8a3522ef84fdafb785f730691091c6')

build() {
  cd $srcdir/${pkgname}-${pkgver}.0
  ./configure --prefix=/usr
  sed -i '/gcrontabdocdir/s/doc\//share\/doc\//' Makefile
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}.0
  make DESTDIR=${pkgdir} install
  install -D -m644 pixmaps/gcrontab.xpm $pkgdir/usr/share/pixmaps/gcrontab.xpm
  install -D -m644 $srcdir/gcrontab.desktop $pkgdir/usr/share/applications/gcrontab.desktop
}
