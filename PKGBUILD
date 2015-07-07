# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>
 
pkgname=otb-ice
pkgver=0.3.0
pkgrel=2
pkgdesc="ORFEO Toolbox (OTB) is an open source library of image processing algorithms"
arch=(x86_64 i686)
url="http://www.orfeo-toolbox.org/otb/"
license=('CeCILL')
groups=()
depends=('glfw' 'glew' 'orfeo-toolbox' )
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://freefr.dl.sourceforge.net/project/orfeo-toolbox/Ice-$pkgver.tgz)
noextract=()
md5sums=('6432f1cce1e8f7dfc5566964d229d76a')
 
build() {
  
  cd $srcdir/  
  msg "Extracting archive..." 
  msg "starting make..."
  #rm -rf OTB/Examples
  if [ -d "$srcdir/build/" ]; then
    rm -rf $srcdir/build/
  fi
  mkdir $srcdir/build/
  cd $srcdir/build
 
  cmake ../Ice-$pkgver \
	-DCMAKE_INSTALL_PREFIX=/usr \
  -DITK_DIR=/usr/lib64/cmake/ITK-4.7 \
  -DOTB_DIR=/usr/lib64/cmake/OTB-5.0 \
	  -Wno-dev
  
  make 
}
 
package() {
 
  cd "$srcdir/"build
  make DESTDIR="$pkgdir" install
}