# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: éclairevoyant
# Contributor: xiretza <xiretza+aur at gmail dot com>

pkgname=python-discord
pkgver=2.5.2
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
b2sums=('3b761a88d4205651cafb889c2f2c618bbf6792d297952e068d1c515a7c6bead8fc874020ae8235187159a899dc4ff960d48ba3e6d34b98c299ec381e7e63477d')

build() {
	cd $_tarname
	python -m build -wn
}

package() {
	cd $_tarname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python -m installer -d "$pkgdir" dist/*.whl
}
