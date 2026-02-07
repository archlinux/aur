# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp-git
pkgver=r3322.4dc08825
pkgrel=1
pkgdesc="An XMPP library written for Python 3.7+ (SleekXMPP asyncio fork)"
arch=(any)
url="https://codeberg.org/poezio/slixmpp"
license=('MIT')
depends=('python>=3.7' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp' 'python-typing_extensions' 'python-setuptools-scm')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-maturin' 'python-setuptools-rust')
provides=('python-slixmpp')
conflicts=('python-slixmpp')
options=(!emptydirs)

source=("git+https://codeberg.org/poezio/slixmpp.git")
md5sums=('SKIP')

pkgver() {
    cd slixmpp
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd slixmpp
    python -m build --wheel --no-isolation
}

package() {
    cd slixmpp
    python -m installer --destdir="$pkgdir" dist/*.whl
}
