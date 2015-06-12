# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=redeemer
pkgver=1
pkgrel=2
pkgdesc="3d shooting game"
url=('http://hippo.nipax.cz/download.cz.php?id=65')
arch=('i686')
license="GPL-2"
depends=('allegro')
source=("http://hippo.nipax.cz/src/${pkgname}-src.tar.gz" "redeemer.desktop")
md5sums=('ad8e5344ac4278c393828e8046867418'
         '8f117d6f1823ecc5b334b270beeaf514')

build() {
cd $srcdir/${pkgname}-src
mkdir -p $pkgdir/usr/{bin,share/redeemer/{cfg,models,scenes,textures}}
# some patching needed here
patch < ../../ph.patch src/ph.h

cd src/
g++ *.cpp -Wall -lGL -lGLU -lSDL_image `sdl-config --libs --cflags` -o ../data/redeemer -O3

cd ../data
install -D -m644 cfg/* $pkgdir/usr/share/redeemer/cfg
install -D -m644 models/* $pkgdir/usr/share/redeemer/models
install -D -m644 scenes/* $pkgdir/usr/share/redeemer/scenes
install -D -m644 textures/* $pkgdir/usr/share/redeemer/textures
install -D -m644 redeemer.cfg $pkgdir/usr/share/redeemer/redeemer.cfg
install -D -m755 redeemer $pkgdir/usr/share/redeemer/redeemer
( echo "#!/bin/bash
cd /usr/share/redeemer
./redeemer" ) > $pkgdir/usr/bin/redeemer
chmod 755 $pkgdir/usr/bin/redeemer
install -D -m644 $srcdir/redeemer.desktop $pkgdir/usr/share/applications/redeemer.desktop || return 1
}
