# Contributor: Jose Riha <jose1711 gmail com>
# Maintainer: Gileri <e + aur2419 at linuxw dot info>

pkgname=mapillary_tools-git
_pkgname=mapillary_tools
pkgver=r1746.008bdc16
pkgrel=1
pkgdesc="Library for processing and uploading geotagged images to Mapillary"
url="https://github.com/mapillary/mapillary_tools"
depends=(
  'python-appdirs'
  'python-construct'
  'python-exifread'
  'python-gpxpy'
  'python-jsonschema'
  'python-piexif'
  'python-pynmea2'
  'python-requests'
  'python-tqdm'
  'python-typing_extensions'
)
makedepends=(git python-build python-installer python-wheel)
provides=(mapillary_tools)
license=('BSD')
arch=('any')
source=("${pkgname}"::'git+https://github.com/mapillary/mapillary_tools.git')
md5sums=('SKIP')

build() {
  cd $srcdir/${pkgname}
  python -m build --wheel --no-isolation
}

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/${pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
