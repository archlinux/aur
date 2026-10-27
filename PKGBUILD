# Maintainer: kutu OS contributors <https://github.com/kutuso/doctor>

pkgname=kutu-doctor
pkgver=0.2.0
pkgrel=1
pkgdesc='Live memory-health dashboard and checker for kutu OS (zswap, MGLRU, DAMON, PSI)'
arch=(any)
url='https://github.com/kutuso/doctor'
license=(MIT)
depends=(python python-typer python-rich)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('337fd9d100721707094586d4305527ef815d8e2ebad855396a12a9380db818d6')

build() {
  cd "doctor-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "doctor-$pkgver"
  PYTHONPATH="$PWD/src" python -m pytest -p no:cacheprovider
}

package() {
  cd "doctor-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
