# Maintainer: éclairevoyant
# Contributor: xiretza <xiretza+aur@gmail.com>
pkgname=python-discord
pkgver=2.0.1
_tarname=discord.py-$pkgver
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python"
arch=('any')
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python-aiohttp>=3.7.4' 'python-aiohttp<4')
makedepends=('python-setuptools')
optdepends=('python-pynacl>=1.3.0: voice support'
			'libffi: voice support'
			'python-orjson>=3.5.4: speed support'
			'python-aiodns: speed support'
			'python-brotli: speed support'
			'python-cchardet=2.1.7: speed support'
			'python<3.10: speed support')
source=("$_tarname.tar.gz::https://github.com/Rapptz/discord.py/archive/v$pkgver.tar.gz")
sha512sums=('339f5feb2a5873e909555af6f868d8bbdb4fd59410b8042ac4c0643ff9c125df98839289ac051d578a7b6ff222b166d1404718c1c9b8a9fdeef598214058e616')

build() {
	cd "$srcdir/$_tarname"
	python setup.py build
}

package() {
	cd "$srcdir/$_tarname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
