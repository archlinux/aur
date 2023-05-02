# Maintainer: éclairevoyant
# Contributor: xiretza <xiretza+aur@gmail.com>

pkgname=python-discord
pkgver=2.2.3
_tarname=discord.py-$pkgver
pkgrel=1
pkgdesc="Discord API wrapper written in Python"
arch=(any)
url="https://github.com/Rapptz/discord.py"
license=(MIT)
depends=('python-aiohttp>=3.7.4' 'python-aiohttp<4')
makedepends=(python-setuptools)
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
sha512sums=('d7ff7bf45e3c4b4fdd57643b5ad12ebc2c4082e49add1e3494af76c9110f312c455a272aac69dc0ef89dc1c0e2fc991eec3772cd5daf75e2ac3ec4637b1edab6')

build() {
	cd $_tarname
	python setup.py build
}

package() {
	cd $_tarname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
