# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>

pkgname=python-discord-py
_pkgname=discord.py
pkgver=2.3.1
pkgrel=1
pkgdesc="A modern, easy to use, feature-rich, and async ready API wrapper for Discord written in Python"
arch=('x86_64')
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=(
	python
	python-aiohttp
)
optdepends=(
	python-pynacl
)
makedepends=(
	python-setuptools
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
options=(!strip) # strip isn't useful for python files and takes forever
sha256sums=('753fc41cfb947c3bb9de7c6a4216f5e73771444b8c01c49d1e4b548bf4a6b65a')

build() {
	cd discord.py-"$pkgver" || exit 1
	python setup.py build
}

package() {
	cd discord.py-"$pkgver" || exit 1
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
