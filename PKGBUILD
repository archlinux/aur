# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hledger-tui
pkgver=0.0.3
pkgrel=2
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
sha256sums=('eb255842a85a1f444988689b2b68a02fc53ca3513d86668f3c6af95353b03aa3')

build () {
	cd "$_archive"
	python -m build -wn
}

package () {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
