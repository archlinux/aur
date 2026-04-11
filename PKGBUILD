# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hledger-textual
pkgver=0.2.14
pkgrel=1
pkgdesc='terminal user interface for managing hledger journal transactions'
arch=(any)
url="https://github.com/thesmokinator/$pkgname"
license=(MIT)
_pydeps=(textual
         textual-plotext)
depends=(hledger
         pricehist
         python
        "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-uv-build)
_archive="${pkgname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('973fc21cbe1fa26015528ffde8bb025a645ac269bb0b6aa11fbaa23282328772')

prepare () {
	cd "$_archive"
	# Upstream aggressively pins dependencies, including max versions of uv-build
	sed -i -E 's/"([^<>=]+)[<>=][<>=\.,0-9]+"/"\1"/g' pyproject.toml
}

build () {
	cd "$_archive"
	python -m build -wn
}

package () {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
