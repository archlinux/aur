# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=python-binarytree
pkgver=4.0.0
pkgrel=2
pkgdesc="A Python library which provides a simple API to generate, visualize, inspect and manipulate binary trees"
arch=("any")
url="https://github.com/joowani/${pkgname#python\-}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools') 
checkdepends=('python-pytest')
source=("${pkgname}${pkgver}.tar.gz::https://github.com/joowani/${pkgname#python\-}/archive/${pkgver}.tar.gz")
sha256sums=('b0579b03b2a43350947d80661fcc2b4236df8db84de03d3d5ce68b8fe0463a18')

build() {
	cd ${pkgname#python\-}-${pkgver}
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname#python\-}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
	cd "${srcdir}/${pkgname#python\-}"-${pkgver}
	pytest -x tests/test_tree.py
}
