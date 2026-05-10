# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-erddapy
pkgdesc='Retrieve scientific datasets from ERDDAP servers'
pkgver=3.1.1
pkgrel=1
url='https://ioos.github.io/erddapy/'
arch=('any')
license=('BSD-3-Clause')

depends=(
  'python-httpx'
  'python-netcdf4'
  'python-pandas'
  'python-pytz'
  'python-xarray'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
optdepends=(
  'python-joblib: parallel searching'
)

_commit=ad34f53
source=(
  "git+https://github.com/ioos/erddapy.git?signed#commit=$_commit"
)
sha256sums=(
  'ac028baff033e08cb137e87e71cf8a74f5de19db9b6da0eb0789b65b7a904ce2'
)
validpgpkeys=(
  '968479A1AFF927E37D1A566BB5690EEEBB952194'  # GitHub signing key
)

build() {
  cd erddapy
  python -m build --wheel --no-isolation
}

check() {
  cd erddapy
  python -m pytest -rxs tests/test_erddapy.py
}

package() {
  cd erddapy
  python -m installer --destdir="$pkgdir" "dist/erddapy-$pkgver-"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
