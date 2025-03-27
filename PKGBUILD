# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.10.0
pkgrel=1
pkgdesc="An XMPP library written for Python 3.7+ (SleekXMPP asyncio fork)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/poezio/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-maturin')
optdepends=('python-emoji: For compliant XEP-0444 support')
options=(!emptydirs)

source=("https://codeberg.org/poezio/${_pkgbase}/archive/slix-${pkgver}.tar.gz")
sha512sums=('85279dfa59377eda1e12c25cfc77326068a07c27dd5223ca1978903bba56a253f165244adbe6a4b4b3d7a27dece586631003791fa0b23e1aa6a1091b31d88b90')

build() {
    cd $_pkgbase
    rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgbase
    python -m installer --destdir="$pkgdir" dist/*.whl
}
