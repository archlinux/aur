# Maintainer: éclairevoyant
# Contributor: xiretza <xiretza+aur@gmail.com>

pkgname=python-discord
pkgver=2.2.2
_tarname=discord.py-$pkgver
pkgrel=1
pkgdesc="Discord API wrapper written in Python"
arch=('any')
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python-aiohttp>=3.7.4' 'python-aiohttp<4')
makedepends=('python-setuptools')
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
sha512sums=('410ad6b5ad1167677ff4162f9e587cd26ad67b038f9a7528109cdeafd7b268a81c4af78b60849ea2fcf5ad632d120727fa5630d1b958fd2af2aaaedf286de6dc')

build() {
	cd $_tarname
	python setup.py build
}

package() {
	cd $_tarname
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
