# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=blis
pkgname=python-${_pkgname}
pkgver=0.7.5
pkgrel=1
pkgdesc='Fast matrix-multiplication as a self-contained Python library'
arch=(x86_64 aarch64)
url='https://github.com/explosion/cython-blis'
license=(MIT)
depends=(
	cython
	python-numpy
	python-pytest
	python-hypothesis
)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('833e01e9eaff4c01aa6e049bbc1e6acb9eca6ee513d7b35b5bf135d49705ad33')

build() {
	cd "blis-${pkgver}"
	python setup.py build
}

package() {
	cd "blis-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
