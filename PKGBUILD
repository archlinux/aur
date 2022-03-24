# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=blis
pkgname=python-${_pkgname}
pkgver=0.7.7
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
b2sums=('2b4f69317209f808ad7e661392ef6bcd1e3f8e5a7b33a6e4ffe80907f1bdbd4c65a52ca978fa66ea3ad85b2094dd3971e83f0f21e2a0f39f1ee67ce59a95b5b8')

build() {
	cd "blis-${pkgver}"
	python setup.py build
}

package() {
	cd "blis-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
