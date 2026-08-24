# Maintainer: Zyv <zyv@users.noreply.github.com>
pkgname=discord-bot-messenger
pkgver=1.1.0
pkgrel=1
pkgdesc="GUI to send messages through a Discord bot token to any channel it has access to"
arch=('any')
url="https://github.com/zyvxi/discord-bot-messenger"
license=('MIT')
depends=('python' 'python-requests' 'tk')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') # TODO: replace with real checksum after tagging v1.0.0 on GitHub

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 discord-bot-messenger.desktop \
    "$pkgdir/usr/share/applications/discord-bot-messenger.desktop"
  install -Dm644 discord-bot-messenger.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/discord-bot-messenger.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
