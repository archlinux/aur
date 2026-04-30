# Maintainer: stanislav-web <exbay.pro@gmail.com>

pkgname=opendoor
pkgver=5.13.2
pkgrel=1
pkgdesc='Fast CLI for directory discovery, subdomain enumeration, and web asset reconnaissance'
arch=('any')
url='https://github.com/stanislav-web/OpenDoor'
license=('GPL-3.0-only')
depends=(
  'python'
  'python-packaging'
  'python-pysocks'
  'python-six'
  'python-tabulate'
  'python-urllib3'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('26851c428ed198d03b616a23690db4fbea89271967dd0b1d1bc580502dae70bc')

build() {
  cd "OpenDoor-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "OpenDoor-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
