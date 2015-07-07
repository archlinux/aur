# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=glsldevil
pkgver=1.1.5
pkgrel=2
pkgdesc="A tool for debugging the OpenGL shader pipeline"
arch=('i686' 'x86_64')
url="http://www.vis.uni-stuttgart.de/glsldevil/"
license=('custom')
depends=('qt4' 'glu')
changelog=glsldevil.changelog
source=(http://www.vis.uni-stuttgart.de/glsldevil/$pkgname-$pkgver.tar.gz \
        http://www.vis.uni-stuttgart.de/glsldevil/glslDevil.png \
        glsldevil.desktop glsldevil)
md5sums=('2645dbcc17434e7dac7ee6ce61ab2f9b' 'd6e6818f32dab69a73f3019908676638'
         'bef1e6d2bb78326e43c80531bfbd3846' '18fd78dde1b0917e6bcafce127fc81e0')

package() {
  cd $srcdir/$pkgname-$pkgver

  if [ "${CARCH}" = "i686" ]; then
    cd release32
  elif [ "${CARCH}" = "x86_64" ]; then
    cd release64
  fi

  chmod -R +x glsldb libs
  chmod -R +r .
  mkdir -p $pkgdir/opt/glsldevil $pkgdir/usr/bin
  cp -R glsldb libs $pkgdir/opt/glsldevil
  install -m755 $srcdir/glsldevil $pkgdir/usr/bin

  # Installing icon and desktop file
  install -D -m644 $srcdir/glsldevil.desktop $pkgdir/usr/share/applications/glsldevil.desktop
  install -D -m644 $srcdir/glslDevil.png $pkgdir/usr/share/pixmaps/glsldevil.png

  # Install License
  install -D -m 644 license.txt \
  $pkgdir/usr/share/licenses/$pkgname/license.txt  
}

# vim:set ts=2 sw=2 et:
