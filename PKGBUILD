# Maintainer: éclairevoyant
# Contributor: xiretza <xiretza+aur at gmail dot com>

pkgname=python-discord
pkgver=2.3.2
_tarname=discord.py-$pkgver
pkgrel=1
pkgdesc="Discord API wrapper written in Python"
arch=(any)
url="https://github.com/Rapptz/discord.py"
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
b2sums=('53f88fef4bce2eaab9422331150af9696c2cb7f01f329193618fdf5b69276cebebef2b74921d5b76fa3288154704cc7ddc682a5dd70ab74cdc50f951e577c2c9')

build() {
	cd $_tarname
	python -m build -wn
}

package() {
	cd $_tarname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python -m installer -d "$pkgdir" dist/*.whl
}
