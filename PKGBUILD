# Contributor: Marco Asa <marcoasa90 (at) gmail.com>

pkgname=alphaplot-bin 
pkgver=1.02
pkgrel=2
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot"
arch=('x86_64')
url=" http://alphaplot.sourceforge.net/"
license=('GPL')
makedepends=('patchelf')
depends=('glu' 'gsl' 'mesa' 'shared-mime-info' 'hicolor-icon-theme' 'qt5-svg' 'qt5-xmlpatterns' 'qt5-script' 'qt5-datavis3d')
source=(https://sourceforge.net/projects/alphaplot/files/1.02/alphaplot_v1.02_x64_gcc.pkg.tar.xz)
sha256sums=('025e4e3a0975bfb67272f3a374d1a3fbd2a445bfb3307a9ce6f957dc992b0205')

package() {
  tar -xvf alphaplot_v1.02_x64_gcc.pkg.tar.xz
  cp -r $srcdir/usr $pkgdir
  patchelf --replace-needed libgslcblas.so.0 libgslcblas.so "$pkgdir/usr/bin/alphaplot"
  find "$pkgdir/usr/lib/AlphaPlot/plugins" -type f -exec patchelf --replace-needed libgslcblas.so.0 libgslcblas.so {} \;

}

