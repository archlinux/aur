# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=mshr-git
pkgdesc="Mesh generation component of FEniCS."
pkgver=20150213
pkgrel=1
_branch=master
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/mshr"
license=('GPL3')
groups=('fenics-git')
provides=('mshr')
depends=('dolfin-git')
makedepends=('git' 'cmake')
options=(!emptydirs)
source=("mshr::git+https://bitbucket.org/fenics-project/mshr.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
  cd mshr
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
    cd mshr
    [ -d build ] && rm -rf build
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd mshr/build
    make install DESTDIR="${pkgdir}"
}
