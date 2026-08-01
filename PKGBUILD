# Maintainer: foxinwinter <179904685+foxinwinter at users dot noreply dot github dot com>

pkgname=forager
pkgver=0.1.1
pkgrel=2
pkgdesc="Steam-like game launcher for your local game library"
arch=('x86_64')
url="https://github.com/foxinwinter/forager"
license=('AGPL-3.0-only')
depends=('python' 'pyside6' 'python-evdev' 'python-keyring' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("forager-v${pkgver}.tar.gz::https://github.com/foxinwinter/forager/archive/v${pkgver}.tar.gz"
        'forager.desktop')
sha256sums=('08be2d1f03d9757d93a7c91a0af0e022b5b91213a90faf23c2e451ed76fd770b'
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
