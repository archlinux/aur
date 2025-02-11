# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-inventree-part-import
_name=${pkgname#python-}
pkgver=1.8.1
pkgrel=1
pkgdesc="CLI to import parts from into your InvenTree instance"
url="https://github.com/30350n/inventree_part_import"
depends=(
    'python-beautifulsoup4'
    'python-click'
    'python-cutie'
    'python-digikey-api'
    'python-fake-useragent'
    'python-inventree'
    'python-isocodes'
    'python-platformdirs'
    'python-requests'
    'python-tablib'
    'python-thefuzz'
    'python-yaml'
)
makedepends=(python-build python-installer python-wheel python-poetry)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a721478258a1619687f285dc3fed4b5a055ea73c74a65f16adb872bd009f3749')

build() {
    cd "$srcdir/${_name//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
