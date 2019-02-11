pkgname=python-slixmpp-git
pkgver=r2234.74ed50e6
pkgrel=1
pkgdesc="An XMPP library written for Python 3.5+ (SleekXMPP asyncio fork)"
arch=(any)
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python>=3.5' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp')
provides=('python-slixmpp')
conflicts=('python-slixmpp')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("git://git.poez.io/slixmpp")
md5sums=('SKIP')

pkgver() {
    cd slixmpp
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd slixmpp
    # make sure UNICODE characters in the README are parsed correctly
    export LC_CTYPE=en_US.utf-8
    python setup.py install --root="$pkgdir/" --optimize=1
}
