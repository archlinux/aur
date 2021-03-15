# Maintainer: Julian Hornich <hornich at kth dot se>
pkgname=ufl-hpc-git
pkgdesc="Unified form language. HPC version"
pkgver=1.2.0_20210216
pkgrel=1
_branch=master
arch=('i686' 'x86_64')
url="https://bitbucket.org/adaptivesimulations/ufl-hpc/"
license=('LGPL')
groups=('dolfin-hpc-git')
depends=('python' 'python-six')
makedepends=('git' 'python')
provides=('ufl-hpc')
conflicts=('ufl')
options=(!emptydirs)
source=("ufl::git+https://bitbucket.org/adaptivesimulations/ufl-hpc.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
  cd ufl
  echo "$(grep 'version =' setup.py | sed 's/.*= \"//;s/\"//')_$(git log --format="%cd" --date=short -1 | sed 's/-//g')"
}

prepare() {
  cd ufl
}

build() {
  cd ufl
  python setup.py build
}

package() {
  cd ufl
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
