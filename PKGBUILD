# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>
# Contributor: Joel Niemelä
pkgname=kattis-problemtools
pkgver=1.20261105
pkgrel=1
pkgdesc="Tools to manage problem packages using the Kattis problem package format"
arch=('x86_64')
url="https://github.com/Kattis/problemtools"
license=('MIT')
depends=('python' 'python-yaml' 'python-unidecode' 'python-colorlog' 'python-nh3' 'python-pydantic' 'python-checktestdata' 'pandoc' 'plastex' 'ghostscript' 'texlive-fontsrecommended' 'texlive-langcyrillic' 'texlive-latexextra' 'texlive-plaingeneric' 'texlive-luatex' 'tidy' 'pdf2svg')
makedepends=('make' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest')
provides=('problem2html'  'problem2pdf'  'verifyproblem')
source=("https://pypi.org/packages/source/p/problemtools/problemtools-${pkgver}.tar.gz")
sha256sums=('c95d424c210ecbfb00154c841237eb3936c133bd8852716831c3b59188b8a1ad')

build() {
	cd "problemtools-$pkgver"
	export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PROBLEMTOOLS="$pkgver"
	python3 setup.py build
}

check() {
	cd "problemtools-$pkgver"
	PYTHONPATH=. pytest
}

package() {
	cd "problemtools-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python3 setup.py install --prefix /usr --root="$pkgdir" || return 1
}
