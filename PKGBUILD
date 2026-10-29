# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shot-scraper"
_name=${pkgname#python-}
pkgver=1.12
pkgrel=1
pkgdesc="A command-line utility for taking automated screenshots of websites"
url="https://shot-scraper.datasette.io/"
license=("Apache-2.0")
arch=("any")
depends=("python"
         "python-click-default-group"
         "python-playwright")
makedepends=("python-uv-build"
             "python-build"
             "python-installer"
             "python-wheel"
             "python-setuptools")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
b2sums=('7d525fefc6e9f727f644a9ff5a90c57b2529ef8ba75342d42f602263da929421f1462252baade41941a8d8b5920a26707c60ec1a2e13bb8b310f961daca098e9')

build(){
 cd "${_name//-/_}-$pkgver"
 # upstream pins uv_build<0.10, Arch has a newer one
 python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
