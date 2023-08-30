# Maintainer: lpt <aur AT lucapetrucci DOT net>
pkgname=tgeraser
pkgver=1.1.2
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
	'python-pyyaml'
	'python-rsa'
	'python-telethon'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(
	"https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
	'c8b9d01fe749de6fe1f7b1f286d30608195e1d94aed1977ec62ac2c85baf4ebf'
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
