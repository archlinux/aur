pkgname=python-slixmpp-git
_pkgbase=slixmpp
pkgver=r2038.bd6ec10
pkgrel=1
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=(any)
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python>=3.4' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules')
provides=('python-slixmpp')
makedepends=('git')
optdepends=('cython')
options=(!emptydirs)

source=("git://git.poez.io/slixmpp")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgbase"
    # make sure UNICODE characters in the README are parsed correctly
    export LC_CTYPE=en_US.utf-8
    python setup.py install --root="$pkgdir/" --optimize=1
}
