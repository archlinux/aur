# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-dolfin-git
pkgdesc="Python interface of FEniCS for ordinary and partial differential equations."
pkgver=20201015
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/FEniCS/dolfinx"
license=('GPL3')
groups=('fenics-git')
depends=('dolfin-git' 'python-pkgconfig' 'python-ply' 'python-mpi4py' 'petsc4py' 'slepc4py')
optdepends=('python-matplotlib: plotting support')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("dolfin::git+https://github.com/FEniCS/dolfinx.git")
md5sums=('SKIP')

pkgver() {
    cd dolfin
    git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
    [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
    [ -e /etc/profile.d/slepc.sh ] && [ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

    cd dolfin/python
    python setup.py build
}

package() {
    cd dolfin/python
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
