# Maintainer: éclairevoyant
# Contributor: xiretza <xiretza+aur@gmail.com>

pkgname=python-discord
pkgver=2.1.1
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
sha512sums=('9226a096d44bef51933f0ab16bd318bd97f7df56ab8dd1afe7cb93c146ba54524ed2d981affb1cc9d6280b6e124b4f391f1cf3fffe5bbaa861d7e0f79b48ff92')

build() {
	cd $_tarname
	python setup.py build
}

package() {
	cd $_tarname
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
