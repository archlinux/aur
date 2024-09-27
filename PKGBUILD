# Maintainer: Leon Richardt <aur at leon dot dev>
# Contributor: jerry73204 <jerry73204 at google gmail>
pkgname='python-mapbox-vector-tile'
pkgver=2.1.0
pkgrel=1
pkgdesc='Python package for encoding & decoding Mapbox Vector Tiles'
arch=('any')
url='https://github.com/tilezen/mapbox-vector-tile'
license=('MIT')
depends=(
    'python'
    'python-protobuf'
    'python-shapely'
    'python-future'
    'python-pyclipper'
)
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-poetry')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9a0572e483c7b06762af73b9b5ee5f4e58441bcca9190105fe55cec71dd16cd8')

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
