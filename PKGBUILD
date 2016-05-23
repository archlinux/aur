# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>
 
pkgname=otb-ice
_pkgname=otb-ice
pkgver=0.4.1
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
source=(https://www.orfeo-toolbox.org/packages/archives/Ice/Ice-$pkgver.tar.gz)
noextract=()
md5sums=('e7341dd0eed6bcf706af15ba99f26362')
 
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
 
  cmake ../$pkgname \
	-DCMAKE_INSTALL_PREFIX=/usr \
  -DITK_DIR=/usr/lib64/cmake/ITK-4.9 \
  -DOTB_DIR=/usr/lib64/cmake/OTB-5.4 \
	  -Wno-dev
  
  make 
}
 
package() {
 
  cd "$srcdir/"build
  make DESTDIR="$pkgdir" install
}


