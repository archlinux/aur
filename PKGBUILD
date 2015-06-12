# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=gfusion-demo
pkgver=1
pkgrel=2
pkgdesc="Galcon Fusion is a high-paced multi-player galactic arcade-strategy game (demo)"
arch=('i686')
url="http://www.galcon.com/fusion/"
license=('custom:free_demo')
makedepends=('imagemagick' 'mesa')
depends=('sdl_image')
source=("http://www.galcon.com/fusion/files/gfusion.tgz" "gfusion-demo.desktop")
md5sums=('ad7781d4eadd9612a5fb6f026073e126'
         'fb11aeb07b3ef6e26edba60ba0ec0eaf')

build() {
true
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,share/gfusion-demo/{data,bin}}
  cd $srcdir/gfusion
  install -D -m644 bin/libIrrKlang.so ${pkgdir}/usr/share/gfusion-demo/bin/libIrrKlang.so
  install -D -m755 bin/sdlapp ${pkgdir}/usr/share/gfusion-demo/bin/sdlapp
  install -D -m644 data/* ${pkgdir}/usr/share/gfusion-demo/data/
  (echo "#!/bin/bash
cd /usr/share/gfusion-demo/bin
./sdlapp \"\$@\"") > $pkgdir/usr/bin/gfusion-demo
  chmod 755 $pkgdir/usr/bin/gfusion-demo
  install -D -m644 $srcdir/gfusion-demo.desktop $pkgdir/usr/share/applications/gfusion-demo.desktop || return 1
  convert data/icon32.bmp data/icon32.png
  install -D -m644 data/icon32.png $pkgdir/usr/share/pixmaps/gfusion-demo.png || return 1
}
