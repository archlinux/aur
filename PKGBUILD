# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=python-bidict
pkgver=0.14.2
pkgrel=1
pkgdesc='Bidirectional map implementation and related functionality to work with one-to-one mappings in Python 3'
arch=('any')
url='https://bidict.readthedocs.org/'
license=('MPLv2')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.python.org/packages/00/bd/043125d6ecb0532b0e379784d356936e1f366fcf9f5a11b36b9d88c497b5/bidict-${pkgver}.tar.gz")
sha256sums=('3f6ec9df779b919fcf8998be8955ade9c4337df04d215a0a0e4296f66e70eac9')

build() {
	cd "bidict-${pkgver}"
	python3 setup.py build
}

check() {
	cd "bidict-${pkgver}"

	# This doctest is failing on a missing function on an object in another library
	# Disable it for now
	python3 setup.py test --addopts=--ignore=docs/sortedbidicts.rst.inc
}

package() {
	cd "bidict-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
