# Maintainer: lpt <aur AT lucapetrucci DOT net>
pkgname=tgeraser
pkgver=1.2.7
pkgrel=1
pkgdesc="Delete all your messages from chat/channel/dialog on Telegram"
arch=('any')
url="https://github.com/en9inerd/tgeraser"
license=('MIT')
depends=(
	'python'
	'python-docopt'
	'python-pyaes'
	'python-pyasn1'
	'python-rsa'
	'python-telethon'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(
	"https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
	'c2631f39c9d4407b09899725926483987d4e889d6682e11ddf74cc8b6e6d2baf'
)

build () {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
