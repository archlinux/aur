# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=tamagotchi_boxing
pkgver=0.1
pkgrel=3
pkgdesc="A game where you train a virtual pet to become a boxer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tamagotchi-boxing/"
license=('GPL')
install=tamagotchi_boxing.install
depends=('sge' 'sdl_ttf' 'gcc-libs')
makedepends=('cmake')
source=("http://tamagotchi-boxing.googlecode.com/files/${pkgname}-${pkgver}.tar.gz" "tamagotchi_boxing.desktop")
md5sums=('f0dae22511c2ba74bef53cae64df78fd'
         '1a42aaa10b608438ccf7fd0eebded929')

build() {
  mkdir -p ${pkgdir}/usr/bin
  install -D -m644 $srcdir/tamagotchi_boxing.desktop $pkgdir/usr/share/applications/tamagotchi_boxing.desktop
  cd $srcdir/${pkgname}/src
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr/share/tamagotchi_boxing
  make
}

package() {
  cd $srcdir/${pkgname}/src
  make DESTDIR=$pkgdir install 
  (echo "#!/bin/bash
cd /usr/share/tamagotchi_boxing
./tamagotchi_boxing \"\$@\"") > $pkgdir/usr/bin/tamagotchi_boxing
  chmod 755 $pkgdir/usr/bin/tamagotchi_boxing
}
