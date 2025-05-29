# Maintainer: lpt <aur AT lucapetrucci DOT net>
pkgname=tgeraser
pkgver=1.4.1
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
	'ccd2d36c89526dd9424c84f84fd572f87ecdab81bc04ae93e847fc00f979f3a3'
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
