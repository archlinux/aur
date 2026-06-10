# Maintainer: lpt <aur AT lucapetrucci DOT net>
pkgname=tgeraser
pkgver=1.6.0
pkgrel=1
pkgdesc="Delete all your messages from chats and channels on Telegram"
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
	'adc5e1d2f731fb3495e1b24ddf2ec604b711658ceadf93e15f2fe57f00969b71'
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
