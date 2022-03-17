# Maintainer: Matyas Mehn <matyas.mehn at tum dot de>
# PKGBUILD adapted from: Daniel Landau <aur@landau.fi> https://aur.archlinux.org/packages/qcsxcad

_pkgname=QCSXCAD
pkgname=qcsxcad-git
provides=("qcsxcad")
conflicts=("qcsxcad")
pkgver=20220317
pkgrel=1
pkgdesc="Qt-GUI for CSXCAD"
arch=("x86_64")
url="https://github.com/thliebig/$_pkgname"
license=("LGPL3")
depends=("csxcad-git" "openems" "tinyxml" "vtk" "qt5-base" "ospray" "openvr" "pdal" "liblas" "adios2" "gl2ps" "cgns" "openmpi" "openmp" "eigen" "utf8cpp")
makedepends=("cmake" "python-mpi4py")
optdepends=()
source=("git+https://github.com/thliebig/$_pkgname"
)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${_pkgname}/build"
  cmake ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make install DESTDIR="$pkgdir"
}
