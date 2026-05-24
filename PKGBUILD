# Maintainer: Xuelin Yang <xuelin@adamantyee.cc>
pkgname=python-pymupdf4llm
_pypiname=pymupdf4llm
pkgver=1.27.2.3
pkgrel=1
pkgdesc='PyMuPDF utilities for LLM/RAG'
arch=('any')
url='https://github.com/pymupdf/pymupdf4llm'
license=('AGPL-3.0-only')
depends=(
	'python-pymupdf=1.27.2.3'
	'python-pymupdf-layout=1.27.2.3'
	'python-tabulate'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-pipcl'
)
source=("https://files.pythonhosted.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('42ec1a47ddc62be3f4f40c116d27618611c6f9fa366719016d9ddc3f3a3dc22b')

prepare() {
	cd "${_pypiname}-${pkgver}"
	git init -q
	git add src
}

build() {
	cd "${_pypiname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pypiname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
