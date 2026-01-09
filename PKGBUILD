# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hledger-tui
pkgver=0.0.2
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
sha256sums=('21a1d5f858edea15de35f95ea931b4b17492d4db1f2fec4b308ec53a254f4e7e')

build () {
	cd "$_archive"
	python -m build -wn
}

package () {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
