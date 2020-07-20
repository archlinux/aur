# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-scikit-surprise
_reponame="Surprise"
pkgver=1.1.1
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
sha512sums=('ad058a5d131bce93032e599e144bf5fda999c05d8ebade01012d49d696f18636f8ad24dd7dfc5945aa3786f9bd9b14a5180a4aeeded3942a749757aa88e79143')

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
