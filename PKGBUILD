# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>

pkgname=python-discord-py
_pkgname=discord.py
pkgver=2.3.1
pkgrel=3
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
	python-wheel
	python-build
	python-installer
)
source=(
	"https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
)
options=(!strip) # strip isn't useful for python files and takes forever
sha256sums=('8eb4fe66b5d503da6de3a8425e23012711dc2fbcd7a782107a92beac15ee3459')

build() {
	cd discord.py-"$pkgver" || exit 1
	python -m build --wheel --no-isolation
}

package() {
	cd discord.py-"$pkgver" || exit 1
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
