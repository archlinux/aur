# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=itk
pkgname=$_pkgname-git
pkgver=4.9.1.511.gf3ac5ea
pkgrel=1
pkgdesc='Open-source, cross-platform C++ toolkit for segmentation and registration'
arch=('i686' 'x86_64')
url='http://www.itk.org'
license=('Apache')
depends=('hdf5-cpp-fortran' 'gdcm' 'libjpeg-turbo' 'libpng' 'libtiff')
makedepends=('git' 'cmake' 'python' 'swig')
provides=("$_pkgname" "insight-toolkit" "insight-toolkit-git")
conflicts=("$_pkgname" "insight-toolkit" "insight-toolkit-git")
source=("$_pkgname::git://git.code.sf.net/p/itk/code")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:^v::;s:-:.:g'
}

build() {
  mkdir -p build ; cd build

  # All bindings are triggering failure of CMake or make right now, thus temporarily disabling

  cmake $srcdir/$_pkgname \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=OFF \
      -DCMAKE_INSTALL_PREFIX=/usr \
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
