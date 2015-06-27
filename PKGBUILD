# Maintainer: nic96
pkgname=fracplanet
pkgver=0.4.0
pkgrel=3
pkgdesc="Fractal planet and terrain generator"
url="http://sourceforge.net/projects/fracplanet/"
license=('GPLv2')
arch=('i686' 'x86_64')
depends=('boost' 'qt4' 'mesa')
source=("http://ufpr.dl.sourceforge.net/project/fracplanet/fracplanet/$pkgver/fracplanet-$pkgver.tar.gz"
        "fracplanet.png"
        "fracplanet.desktop")
md5sums=('270a0712c62adf58461cd5e7f7474aa0'
         '5a473c1795840bbc6e4e1fa85627daed'
         '49f4349bbcb693c0bae6c1f24a91f077')

build() {
  cd "$srcdir/$pkgname"
  sed -i '3,8 s/^/#/' "configure"
  ./configure
  sed -i '22 a\#include <GL/glu.h>' "triangle_mesh_viewer_display.cpp"
  sed -i '/\<LIBS\>/ s/$/ -lGLU/' "Makefile"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "$srcdir"/"$pkgname"/fracplanet "$pkgdir"/usr/bin/fracplanet
  install -Dm644 "$srcdir"/fracplanet.desktop "$pkgdir"/usr/share/applications/fracplanet.desktop
  install -Dm644 "$srcdir"/fracplanet.png "$pkgdir"/usr/share/pixmaps/fracplanet.png
}
