# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp-git
pkgver=r3396.853c77f9
pkgrel=1
pkgdesc="An XMPP library written for Python 3 (SleekXMPP asyncio fork)"
arch=('x86_64' 'armv7h' 'aarch64' 'powerpc')
url="https://codeberg.org/poezio/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-rust' 'python-setuptools-scm')
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
