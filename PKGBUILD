# Maintainer: Blake Morrison <hello@truealter.com>
pkgname=alter-messenger
pkgver=0.1.0
pkgrel=1
pkgdesc="Native GTK4 inbox for ALTER alter-to-alter messaging"
arch=('any')
url="https://github.com/true-alter/alter-messenger"
license=('Apache')
depends=(
  'python>=3.11'
  'gtk4'
  'libadwaita'
  'python-gobject'
  'python-httpx'
  'libnotify'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/true-alter/alter-messenger/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 data/alter-messenger.desktop \
    "$pkgdir/usr/share/applications/alter-messenger.desktop"
  install -Dm644 data/alter-messenger.service \
    "$pkgdir/usr/lib/systemd/user/alter-messenger.service"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
