# Maintainer: éclairevoyant
# Contributor: xiretza <xiretza+aur at gmail dot com>

pkgname=python-discord
pkgver=2.3.1
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
b2sums=('fd4d82d882d27a25c2a47d825115820815d0e2a63f9a9be549aeadc80eaf5a0ef00742470caac1f6b0e46ba63be457027c2e8be15d19925dab106482334ef372')

build() {
	cd $_tarname
	python -m build -wn
}

package() {
	cd $_tarname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python -m installer -d "$pkgdir" dist/*.whl
}
