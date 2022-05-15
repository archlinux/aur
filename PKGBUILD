# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=blis
pkgname=python-${_pkgname}
pkgver=0.9.0
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
b2sums=('c214630f5f2a1815eaaf6678db72356f042cc8223812f27d67d404b6658b8a5c47d38fd1b955dc29b6f3e7b3a2240e322e61c14737d92657d175651e5c495920')

build() {
	cd "blis-${pkgver}"
	python setup.py build
}

package() {
	cd "blis-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
