# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-slepc4py-git
pkgdesc="Python bindings for PETSc"
pkgver=20201014
pkgrel=3
arch=('i686' 'x86_64')
url="https://gitlab.com/slepc/slepc4py"
provides=(slepc4py)
conflicts=(slepc4py)
license=('custom')
depends=('slepc-git')
makedepends=('git')
options=(!emptydirs)
source=("slepc4py::git+https://gitlab.com/slepc/slepc4py.git#branch=maint")
md5sums=('SKIP')

pkgver() {
 	cd slepc4py
 	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
 	cd slepc4py
 	python setup.py build
}

package() {
 	cd slepc4py
 	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    install -Dm 644 LICENSE.rst ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst
}
