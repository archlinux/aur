# Maintainer: éclairevoyant
# Contributor: xiretza <xiretza+aur@gmail.com>

pkgname=python-discord
pkgver=2.2.0
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
sha512sums=('4918430d6d43bae37d975921ed2a9089afeb8162742ef28cfd83c0b662a2f2e2f803728a90788f5c62ab87d308f06b6b5b61f9ebaa90149d2da0b9803adec98f')

build() {
	cd $_tarname
	python setup.py build
}

package() {
	cd $_tarname
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
