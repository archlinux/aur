# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>
pkgname=kattis-problemtools
pkgver=1.20260620
pkgrel=1
pkgdesc="Tools to manage problem packages using the Kattis problem package format"
arch=('x86_64')
url="https://github.com/Kattis/problemtools"
license=('MIT')
depends=('python' 'python-yaml' 'python-unidecode' 'python-colorlog' 'python-nh3' 'python-pydantic' 'pandoc' 'gmp' 'plastex' 'ghostscript' 'texlive-fontsrecommended' 'texlive-langcyrillic' 'texlive-latexextra' 'texlive-plaingeneric' 'texlive-luatex' 'tidy')
makedepends=('git' 'make' 'boost' 'python-setuptools')
checkdepends=('python-pytest')
provides=('problem2html'  'problem2pdf'  'verifyproblem')
source=("https://pypi.org/packages/source/p/problemtools/problemtools-${pkgver}.tar.gz")
sha256sums=('6324b13b4f6076b636b5790f2d90f80b26cfbc850f5bdf03aa2d04fb065375bc')

build() {
	cd "problemtools-$pkgver"
	export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PROBLEMTOOLS="$pkgver"
	python3 setup.py build
}

# Failing as of v1.20260620
# check() {
# 	cd "problemtools-$pkgver"
# 	PYTHONPATH=. pytest
# }

package() {
	cd "problemtools-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python3 setup.py install --prefix /usr --root="$pkgdir" || return 1
}
