# Maintainer: Julian Hornich <hornich at kth dot se>
pkgname=ffc-hpc-git
pkgver=1.0.2_20200128
pkgrel=1
pkgdesc="A compiler for finite element variational forms. HPC version"
_branch=feature/python3
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/ffc-hpc"
license=('LGPL')
groups=('dolfin-hpc-git')
depends=('python' 'fiat-hpc-git' 'ufl-hpc-git' 'ufc2-hpc-git' 'python-numpy' 'instant-hpc-git' 'swig' 'python-six')
optdepends=()
makedepends=('git' 'python' 'sed')
provides=('ffc-hpc')
conflicts=('ffc-hpc')
options=(!emptydirs)
source=("ffc-hpc::git+https://bitbucket.org/adaptivesimulations/ffc-hpc.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
    cd ffc-hpc
    echo "$(grep version setup.py | sed 's/.*= //;s/["|,]//g')_$(git log --format="%cd" --date=short -1 | sed 's/-//g')"
}

prepare() {
    cd ffc-hpc
}

build() {
    cd ffc-hpc
    python setup.py build
}

package() {
    cd ffc-hpc
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
