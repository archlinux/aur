# Maintainer: matt quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-nextcord
pkgver=2.6.1
_tarname=nextcord-$pkgver
pkgrel=1
pkgdesc="A Python wrapper for the Discord API forked from discord.py "
arch=(any)
url="https://github.com/nextcord/nextcord"
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
sha256sums=('eb244ccc4991e6272f6d03f3e68f4c39caf369ce37a3338812afbfaf9284a86b')
build() {
	cd $_tarname
	python -m build -wn
}

package() {
	cd $_tarname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python -m installer -d "$pkgdir" dist/*.whl
}
