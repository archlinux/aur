# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: éclairevoyant
# Contributor: xiretza <xiretza+aur at gmail dot com>

pkgname=python-discord
pkgver=2.6.3
_tarname=discord.py-$pkgver
pkgrel=1
pkgdesc="Discord API wrapper written in Python"
arch=(any)
url="https://github.com/Rapptz/discord.py"
license=(MIT)
depends=('python-aiohttp>=3.7.4' 'python-aiohttp<4' 'python-audioop')
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
b2sums=('aad11dd2f78acd3bd4d7ec05d0c7148352360102446d35827b4feac47c95fd6779de16da4cad5a99a5727a2bd45ee76c2db68ba9fa556fc7e0ce1d4508e5e03b')

build() {
	cd $_tarname
	python -m build -wn
}

package() {
	cd $_tarname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python -m installer -d "$pkgdir" dist/*.whl
}
