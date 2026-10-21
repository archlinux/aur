# Maintainer: YatoVoid
pkgname=tankobon
pkgver=0.1.1
pkgrel=1
pkgdesc="Pack downloaded manga chapters into one ordered .cbz per volume, ready for e-reader conversion"
arch=('any')
url="https://github.com/YatoVoid/manga-to-ereader"
license=('MIT')
depends=('python' 'pyside6')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24d8c9c72d2717db7a5686bc9ca704762a86974948887c6e46b979054abe6cd6')

build() {
  cd "manga-to-ereader-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "manga-to-ereader-$pkgver"
  PYTHONPATH=src QT_QPA_PLATFORM=offscreen python -m pytest -q
}

package() {
  cd "manga-to-ereader-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/linux/tankobon.desktop "$pkgdir/usr/share/applications/tankobon.desktop"
  install -Dm644 src/tankobon/icon.png "$pkgdir/usr/share/pixmaps/tankobon.png"
}
