# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-scikit-surprise
_reponame="Surprise"
pkgver=1.1.2
pkgrel=1
pkgdesc="Python scikit for building and analyzing recommender systems"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/NicolasHug/${_reponame}"
depends=('python-joblib' 'python-numpy' 'python-scipy' 'python-six')
optdepends=("flake8: code linting to comply with contributing standards"
	"python-pandas: dataframe handling"
	"python-pytest: test suite"
	"python-sphinx: documentation generator"
	"python-sphinx_rtd_theme: Read The Docs theme for documentation generator"
	"python-sphinxcontrib-spelling: spelling extension for documentation generator")
makedepends=('python-setuptools' 'cython')
provides=()
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/NicolasHug/${_reponame}/archive/v${pkgver}.tar.gz")
sha512sums=('374af0a2aee2ca759df1f627e177bb56bbcccf8eaac4846bd7bce5587bb1a3b4505d511b93b3466062b029d2d015c1932fda8aa64be985d30e99a52e0b47342a')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	ln -s surprise "${pkgdir}/usr/bin/surprise3"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
