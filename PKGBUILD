# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hledger-tui
pkgver=0.1.1
pkgrel=1
pkgdesc='keyboard-driven terminal UI for viewing and analyzing your hledger financial data'
arch=(any)
url="https://github.com/lucabello/$pkgname"
license=(Apache-2.0)
_pydeps=(sh
         textual
         textual-plotext
         typer)
depends=(hledger
         python
        "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-uv-build)
_archive="${pkgname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('ad36faa464afc7e60770437247f3d32a663538b63c63a413fecae9c4a51dda69')

build () {
	cd "$_archive"
	python -m build -wn
}

package () {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
