# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-scikit-surprise
_reponame="Surprise"
pkgver=1.1.0
pkgrel=2
pkgdesc="Python scikit for building and analyzing recommender systems"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/NicolasHug/${_reponame}"
depends=()
makedepends=('python-setuptools' 'cython' 'python-numpy')
provides=()
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/NicolasHug/${_reponame}/archive/v${pkgver}.tar.gz")
sha512sums=('d8f28786029079ac9db52c61c4b5bf30150da96718e292cad90bb58f7d25173391e8686808d3b4e746987059057d21943570ed4be2ad8a1c3e8046e764b93600')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	depends=('python-joblib' 'python-numpy' 'python-scipy' 'python-six')
	optdepends=("flake8: code linting to comply with contributing standards"
		"python-pandas: dataframe handling"
		"python-pytest: test suite"
		"python-sphinx: documentation generator"
		"python-sphinx_rtd_theme: Read The Docs theme for documentation generator"
		"python-sphinxcontrib-spelling: spelling extension for documentation generator")

	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	ln -s surprise "${pkgdir}/usr/bin/surprise3"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
