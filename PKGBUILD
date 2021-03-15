# Maintainer: Julian Hornich <hornich at kth dot se>
pkgname=fiat-hpc-git
pkgdesc="Supports generation of arbitrary order instances of the Lagrange elements on lines, triangles, and tetrahedra. HPC version"
pkgver=1.6.0_20210216
pkgrel=1
_branch=master
arch=('i686' 'x86_64')
url="https://bitbucket.org/adaptivesimulations/fiat-hpc"
license=('LGPL')
groups=('dolfin-hpc-git')
depends=('python' 'python-numpy')
provides=('fiat-hpc')
conflicts=('fiat')
options=(!emptydirs)
source=("fiat::git+https://bitbucket.org/adaptivesimulations/fiat-hpc.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
  cd fiat
  echo "$(grep 'version =' setup.py | sed 's/.*= \"//;s/\"//')_$(git log --format="%cd" --date=short -1 | sed 's/-//g')"
}

prepare() {
  cd fiat
}

build() {
  cd fiat
  python setup.py build
}

package() {
  cd fiat
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
