# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=itk
pkgname=$_pkgname-git
pkgver=5.3rc02.220.g6682f865b3
pkgrel=1
pkgdesc='Open-source, cross-platform C++ toolkit for segmentation and registration'
arch=('i686' 'x86_64')
url='https://www.itk.org'
license=('Apache')
depends=('eigen' 'gdcm-git' 'gtest' 'hdf5-openmpi')
makedepends=('git' 'cmake')
provides=("$_pkgname" "insight-toolkit"{,-git})
conflicts=("$_pkgname" "insight-toolkit"{,-git})
source=("git+https://github.com/insightsoftwareconsortium/itk.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:^v::;s:-:.:g'
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake $srcdir/$_pkgname \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=OFF \
      -DITK_USE_SYSTEM_LIBRARIES=ON \
      -DITK_USE_SYSTEM_GDCM=ON \
      -DITK_WRAP_JAVA=OFF \
      -DITK_WRAP_PERL=OFF \
      -DITK_WRAP_PYTHON=OFF \
      -DITK_WRAP_RUBY=OFF \
      -DITK_WRAP_TCL=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
