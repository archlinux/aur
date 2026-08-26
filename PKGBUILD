# Maintainer: Zyv <zyv@users.noreply.github.com>
pkgname=discord-bot-messenger
pkgver=1.4.1
pkgrel=1
pkgdesc="GUI to send messages through a Discord bot token to any channel it has access to"
arch=('any')
url="https://github.com/zyvxi/discord-bot-messenger"
license=('MIT')
depends=('python' 'python-requests' 'python-websockets' 'tk')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da8114d3dda071c2fadd7471973643654c5337007cb06e6aae51862d3c22995e')

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
