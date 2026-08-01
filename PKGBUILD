# Maintainer: foxinwinter <179904685+foxinwinter at users dot noreply dot github dot com>

pkgname=forager
pkgver=0.1.2
pkgrel=2
pkgdesc="Steam-like game launcher for your local game library"
arch=('x86_64')
url="https://github.com/foxinwinter/forager"
license=('AGPL-3.0-only')
depends=('python' 'pyside6' 'python-evdev' 'python-keyring' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("forager-v${pkgver}.tar.gz::https://github.com/foxinwinter/forager/archive/v${pkgver}.tar.gz"
        'titlebar-signal-emit.patch'
        'forager.desktop')
sha256sums=('ed1944f24f3bc467b79defdc4a7ec462d698586e42fc87c74accabab68e0f2ac'
            'c816af3dad1cdc121fb56dda5555ca1040e279cc0cf536bbbfa1a037bef0b05a'
            'f5b25b350334dd490da17325c2408bc51fffae28423ec20b4e60d44a965eddf5')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < ../titlebar-signal-emit.patch
}

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
