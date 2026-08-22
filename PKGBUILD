# Maintainer: Xuelin Yang <xuelin@adamantyee.cc>
pkgname=python-pymupdf4llm
_pypiname=pymupdf4llm
pkgver=1.28.0
pkgrel=1
pkgdesc='PyMuPDF utilities for LLM/RAG'
arch=('any')
url='https://github.com/pymupdf/pymupdf4llm'
license=('AGPL-3.0-only')
depends=(
	"python-pymupdf=${pkgver}"
	"python-pymupdf-layout=${pkgver}"
	'python-tabulate'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-pipcl'
)
source=("https://files.pythonhosted.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('713595be867f7cb52893e57aa1b058d5721d017b2ba7b6a3d185a05e15978852')

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
