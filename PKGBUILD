# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=osgg
pkgver=0.99
pkgrel=3
pkgdesc="a 2D game inspired by lunar lander with sweet 70's style vector graphics"
url="http://osgg.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('sdl_image' 'gcc-libs' 'sdl_ttf' 'libgl' 'sdl_mixer')
source=("http://downloads.sourceforge.net/osgg/${pkgname}-${pkgver}.tar.bz2" "osgg.desktop")
md5sums=('a0115ead6a4e4ff972c00cb0648e5f4d' 'bc8c813dbc1ac6605e691ab9cbb52f84')
build() {
cd $srcdir/${pkgname}
mkdir -p $pkgdir/usr/{share/osgg/levels,bin}
make clean
make
}

package() {
cd $srcdir/${pkgname}
install -D -m755 osgg $pkgdir/usr/share/osgg/osgg
install -D -m644 *.txt $pkgdir/usr/share/osgg/
install -D -m644 *.ogg $pkgdir/usr/share/osgg/
install -D -m644 Bandal.ttf $pkgdir/usr/share/osgg/Bandal.ttf
install -D -m644 levels/* $pkgdir/usr/share/osgg/levels
echo "#!/bin/sh
cd /usr/share/osgg
./osgg \"\$@\"" > $pkgdir/usr/bin/osgg
chmod 755 $pkgdir/usr/bin/osgg
install -D -m644 launcher/icon.png $pkgdir/usr/share/pixmaps/osgg.png
install -D -m644 $srcdir/osgg.desktop $pkgdir/usr/share/applications/osgg.desktop

}
