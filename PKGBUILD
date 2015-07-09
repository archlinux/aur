# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=flburn
pkgver=0.0.3
pkgrel=4
pkgdesc="Optical disk burning software for linux based on the libraries FLTK and libburnia."
arch=('i686' 'x86_64')
url="http://flburn.sourceforge.net/"
license=('GPL2')
depends=('fltk' 'libburn' 'libisofs')
source=(http://sourceforge.net/projects/flburn/files/flburn_${pkgver}/flburn_src_${pkgver}.tar.gz
        $pkgname.desktop)
md5sums=('98ba79eb586d801b822c942c33c0d042'
         '56568821523e459271399afa8a9f0813')

prepare() {
  cd $srcdir/flburn_${pkgver}

  # Fix "uint32_t" errors while compiling
  sed -i 's|-Wall|-Wall -DHAVE_NETINET_IN_H -DHAVE_INTTYPES_H|' compile.sh
}

build() {
  cd $srcdir/flburn_${pkgver}
  sh compile.sh
}

package() {
  cd $srcdir/flburn_${pkgver}
  # Binary
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname

  # Desktop icon
  install -Dm644 $srcdir/flburn.desktop $pkgdir/usr/share/applications/flburn.desktop
  install -Dm644 artwork/icon.png $pkgdir/usr/share/pixmaps/flburn.png
}