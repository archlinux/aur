# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-blis
pkgver=0.7.4
pkgrel=1
pkgdesc="Fast matrix-multiplication as a self-contained Python library"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/explosion/cython-blis"
license=(MIT)
depends=(
	cython
	python-numpy
	python-pytest
	python-hypothesis
)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/b1/54/b0de9905ee80aebd64c333bc112cacfe06849a9b5a7230a02dfde73e7aad/blis-0.7.4.tar.gz")
sha256sums=('7daa615a97d4f28db0f332b710bfe1900b15d0c25841c6d727965e4fd91e09cf')

build() {
	cd "blis-${pkgver}"
	python setup.py build
}

package() {
	cd "blis-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
