# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hledger-textual
pkgver=0.2.10
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
sha256sums=('f9ddc777440e48783d339cffe856e15d4ae9f2a28a198b081254df99b014453a')

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
