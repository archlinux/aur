# Maintainer: matt quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-nextcord
pkgver=3.0.1
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
build() {
sha256sums=('ac4dd4c711ed17940143443ab1ae67c0ea0aa96d7ed1b636fe848c270a61b552')
	cd $_tarname
	python -m build -wn
}

package() {
	cd $_tarname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python -m installer -d "$pkgdir" dist/*.whl
}
