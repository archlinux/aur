# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-petsc4py-git
pkgdesc="Python bindings for PETSc"
pkgver=20200721
pkgrel=2
arch=('i686' 'x86_64')
url="https://gitlab.com/petsc/petsc4py"
provides=(petsc4py)
conflicts=(petsc4py)
license=('custom')
depends=('petsc' 'python-numpy')
makedepends=('git')
options=(!emptydirs)
source=("petsc4py::git+https://gitlab.com/petsc/petsc4py.git")
md5sums=('SKIP')

pkgver() {
 	cd petsc4py
 	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
 	cd petsc4py
 	python setup.py build
}

package() {
 	cd petsc4py
 	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    install -Dm 644 LICENSE.rst ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst
}
