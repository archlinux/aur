# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Based on python-ufl-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=ufl
pkgname=python-${_base}
pkgdesc="Unified form language (stable)."
pkgver=2022.3.0
pkgrel=1
arch=('any')
url="https://github.com/FEniCS/ufl-legacy"
license=('LGPL3')
groups=('fenics')
conflicts=('python-ufl-git')
depends=('python-numpy')
options=(!emptydirs)
makedepends=('python-setuptools')
source=(${_base}-${pkgver}.tar.gz::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2d0f4c88fe151d631e1d389faf61f58bbbe649fd08106e756fd5d6c53213660a')

_basedir=${startdir}/src/${_base}-legacy-${pkgver}

prepare (){
    cd ${_basedir}
    sed -i 's/README.rst/README.md/g' setup.cfg
}

build() {
	cd ${_basedir}
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd ${_basedir}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
