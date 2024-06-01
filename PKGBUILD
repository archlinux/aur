# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-scikit-surprise
_reponame="Surprise"
pkgver=1.1.4
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
sha512sums=('ecb10c3da63ff5aa6968fd73fb2c23503e977309d47cad8e0be2d086d0a867b02a266933d0d5238d598410668c0d15450a338cc748ed5a75bca58048675ce75f')

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
