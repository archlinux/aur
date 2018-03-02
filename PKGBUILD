# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=python-binarytree
pkgver=3.0.1
pkgrel=2
pkgdesc="A Python library which provides a simple API to generate, visualize, inspect and manipulate binary trees"
arch=("any")
url="https://github.com/joowani/${pkgname#python\-}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools') 
checkdepends=('python-pytest')
source=("${pkgname}${pkgver}.tar.gz::https://github.com/joowani/${pkgname#python\-}/archive/${pkgver}.tar.gz")
sha256sums=('af7c683e307792c07c7698c3070af99247c17eb0143f7b81fcf085d8e638b6f9')

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
	pytest -x tests.py
}
