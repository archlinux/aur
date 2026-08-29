# Maintainer: foxinwinter <179904685+foxinwinter at users dot noreply dot github dot com>

pkgname=forager
pkgver=0.5.0
pkgrel=1
pkgdesc="Steam-like game launcher for your local game library"
arch=('x86_64')
url="https://github.com/pawprnt/forager"
license=('AGPL-3.0-only')
depends=('python' 'pyside6' 'python-evdev' 'python-keyring' 'python-pillow' 'steam')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("forager-v${pkgver}.tar.gz::https://github.com/pawprnt/forager/archive/v${pkgver}.tar.gz"
        'forager.desktop')
sha256sums=('d0f4eb26165b50e086fb36fefd8224d2a1ed3ca4f9a388f216d74f979364cef2'
            'f5b25b350334dd490da17325c2408bc51fffae28423ec20b4e60d44a965eddf5')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../forager.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
