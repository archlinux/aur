# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=blis
pkgname=python-${_pkgname}
pkgver=0.7.6
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
b2sums=('8e5b8707a43044d0fe2911b98e7686784c379a75db905b5b83d4a1931921df7c4300ce9250695caeed7312620491dc595e7e1eabaf375e0b3694610bb41f67f9')

build() {
	cd "blis-${pkgver}"
	python setup.py build
}

package() {
	cd "blis-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
