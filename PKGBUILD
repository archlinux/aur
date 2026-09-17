# Maintainer: dasbd72 <twbd723@gmail.com>
pkgname=ip-watch-bot
pkgver=0.2.0
pkgrel=1
pkgdesc="Checks your public IP address and sends a Telegram notification when it changes"
arch=('any')
url="https://github.com/dasbd72/ip-watch-bot"
license=('MIT')
depends=('python' 'python-requests' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname::git+https://github.com/dasbd72/ip-watch-bot.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 systemd/ip-watch-bot.service "$pkgdir/usr/lib/systemd/user/ip-watch-bot.service"
    install -Dm644 systemd/ip-watch-bot.timer "$pkgdir/usr/lib/systemd/user/ip-watch-bot.timer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
