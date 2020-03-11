# Maintainer: Julian Hornich <hornich at kth dot se>
pkgname=ufc2-hpc-git
pkgdesc="Unified form language. HPC version"
pkgver=2.2.0_20200311
pkgrel=1
_branch=master
arch=('i686' 'x86_64')
url="https://bitbucket.org/adaptivesimulations/ufc2-hpc/"
license=('LGPL')
groups=('dolfin-hpc-git')
depends=()
makedepends=('git' 'cmake')
provides=('ufc2-hpc')
conflicts=()
options=(!emptydirs)
source=("ufc2-hpc::git+https://bitbucket.org/adaptivesimulations/ufc2-hpc.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
  cd ufc2-hpc
  echo "$(head -n 1 ChangeLog | sed 's/ .*//')_$(git log --format="%cd" --date=short -1 | sed 's/-//g')"
}

prepare() {
  cd ufc2-hpc
}

build() {
  cd ufc2-hpc
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
 	make
}

package() {
  cd ufc2-hpc/build
  sed -i "s:${pkgdir}::" ufc-1.pc
  sed -i "s:${pkgdir}::" UFCConfig.cmake
  make install
}
