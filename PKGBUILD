# Maintainer: Chris <christopher.r.mullins g-mail>

pkgname=commontk-git
pkgrel=1
pkgdesc='A set of common support code for medical imaging, surgical navigation, and related purposes.' 
pkgver=r5007.0f14f50
arch=('i686' 'x86_64')
url='http://commontk.org'
depends=('qt4')
makedepends=('git' 'cmake' 'subversion')
optdepends=('python2: For scripting support')
license=('Apache')
source=("git://github.com/commontk/CTK.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/CTK
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir
  rm -rf build
  mkdir build
  cd build

  cmake \
    -DCTK_SUPERBUILD:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCTK_LIB_Widgets:BOOL=ON \
    ../CTK

  make
}

package() {
  cd $srcdir/build
  make DESTDIR=${pkgdir} install
}
