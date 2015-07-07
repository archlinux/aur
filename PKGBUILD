# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=monteverdi2
pkgver=0.8.1
pkgrel=2
pkgdesc="A remote sensing application based on Orfeo Toolbox"
arch=(x86_64)
url="http://www.orfeo-toolbox.org/otb/monteverdi.html"
license=('CeCILL')
groups=()
depends=('orfeo-toolbox' 'qwt5' 'otb-ice')
makedepends=()
optdepends=()
provides=(monteverdi2)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://heanet.dl.sourceforge.net/project/orfeo-toolbox/Monteverdi2-$pkgver.tgz)
noextract=()
md5sums=('0f65c161f299b2f8922f7f68b28f5882')
 #generate with 'makepkg -g'


build() {

  cd $srcdir
  msg "starting make..."
  if [ -d build ]; then
    rm -rf build
  fi
  mkdir build
  cd build

  #export CMAKE_PREFIX_PATH="/usr/lib/lib/otb/"
  cmake  ../Monteverdi2-$pkgver -DCMAKE_INSTALL_PREFIX=/usr \
            -DITK_DIR=/usr/lib64/cmake/ITK-4.7 \
            -DOTB_DIR=/usr/lib64/cmake/OTB-5.0 \
            -DOTB_DATA_USE_LARGEINPUT=ON \
	  -DQWT_INCLUDE_DIR=/usr/include/qwt5 \
	  -DQWT_LIBRARY=/usr/lib64/libqwt5.so \
	  -DICE_INCLUDE_DIR=/usr/include/otb
	  
		
  make
}

package() {

  cd "$srcdir/"build
  make DESTDIR="$pkgdir" install
}
