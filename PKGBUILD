# Maintainer: Leon Richardt <aur at leon dot dev>
# Contributor: jerry73204 <jerry73204 at google gmail>
pkgname='python-mapbox-vector-tile'
pkgver=2.2.0
pkgrel=1
pkgdesc='Python package for encoding & decoding Mapbox Vector Tiles'
arch=('any')
url='https://github.com/tilezen/mapbox-vector-tile'
license=('MIT')
depends=(
    'python'
    'python-protobuf'
    'python-shapely'
    'python-pyclipper'
)
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-poetry')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9fbf2e94890429ccdaf8e047019dccadd9deb03f5b2ae9b5c5561d27a20a0eb3')

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
