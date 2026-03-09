# Maintainer: matt quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-disnake
pkgver=2.12.0
_tarname=disnake-$pkgver
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python."
arch=(any)
url="https://github.com/DisnakeDev/disnake"
license=(MIT)
depends=('python-aiohttp>=3.7.4' 'python-aiohttp<4')
makedepends=(python-setuptools python-{build,installer,wheel})
optdepends=(
	'python-pynacl>=1.3.0: voice support'
	'libffi: voice support'
	'python-orjson>=3.5.4: speed support'
	'python-aiodns: speed support'
	'python-brotli: speed support'
	'python-cchardet=2.1.7: speed support'
	'python<3.10: speed support'
)

source=("$_tarname.tar.gz::$url/archive/v$pkgver.tar.gz")
build() {
	cd $_tarname
	python -m build -wn
}

package() {
	cd $_tarname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python -m installer -d "$pkgdir" dist/*.whl
}
sha256sums=('38f127fa10618b630e7a1085c65e3c8d5280209699157f7e9e5285f88356f768')
