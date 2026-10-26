# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.17.0
pkgrel=1
pkgdesc="An XMPP library written for Python 3 (SleekXMPP asyncio fork)"
arch=('x86_64' 'armv7h' 'aarch64' 'powerpc')
url="https://codeberg.org/poezio/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-rust' 'python-setuptools-scm')
optdepends=('python-emoji: For compliant XEP-0444 support')
options=(!emptydirs)

source=("https://codeberg.org/poezio/${_pkgbase}/archive/slix-${pkgver}.tar.gz")
sha512sums=('f2dd5202a813873902c1a61c24d1a71043336ba0f3a81aa5ff31b3cbfeff331bb7cc86e8a62fa425c8d37d506b6ffae6771fa587a4225d63f28f480777bad93f')
build() {
    cd $_pkgbase
    rm -f dist/*.whl
    SETUPTOOLS_SCM_PRETEND_VERSION_FOR_SLIXMPP=$pkgver python -m build --wheel --no-isolation
}

package() {
    cd $_pkgbase
    python -m installer --destdir="$pkgdir" dist/*.whl
}
