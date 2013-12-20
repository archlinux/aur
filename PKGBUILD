# Maintainer : Benjamin Chretien <chretien at lirmm dot fr>

pkgname=eigen3topython-git
_name=eigen3topython
pkgver=20131221
pkgver() {
  date +%Y%m%d
}
pkgrel=1
pkgdesc="Bidirectional bridge between NumPy and Eigen 3."
arch=('i686' 'x86_64')
url="https://github.com/jorisv/Eigen3ToPython"
license=('GPLv3')
depends=('python2' 'eigen3')
makedepends=('doxygen' 'cmake' 'git' 'pkg-config')
provides=('eigen3topython')
source=("${_name}::git+https://github.com/bchretien/Eigen3ToPython")
md5sums=('SKIP')

build()
{
  cd "${srcdir}/${_name}"
  git submodule init
  git submodule update

  mkdir -p ${srcdir}/build && cd ${srcdir}/build

  cmake "${srcdir}/${_name}" -DCMAKE_INSTALL_PREFIX="/usr" \
                             -DCMAKE_BUILD_TYPE="Release"
  make
}

package()
{
  cd ${srcdir}/build
  make DESTDIR="$pkgdir" install
}
