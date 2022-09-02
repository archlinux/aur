# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

pkgname=opensta-git
pkgver=r926.bb50746
pkgrel=1
pkgdesc="A gate level static timing verifier."
arch=('x86_64')
url="https://github.com/The-OpenROAD-Project/OpenSTA"
license=('GPL')
makedepends=('tcl' 'swig' 'bison' 'flex' 'git' 'cmake')
optdepends=(
  'libzip: read Verilog, SDF, SPF, and SPEF files compressed with gzip' 
  'cudd: a binary decision diageram package for improving conditional timing arc handling')
source=("git+https://github.com/The-OpenROAD-Project/OpenSTA.git")
provides=("opensta")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/OpenSTA"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${srcdir}/OpenSTA" \
	-DCUDD=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS"
  cmake --build build
}

package() {
  DESTDIR=${pkgdir} cmake --install build
}
