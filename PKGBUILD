# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.14.1
pkgrel=1
pkgdesc="An XMPP library written for Python 3.7+ (SleekXMPP asyncio fork)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/poezio/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp' 'python-typing_extensions' 'python-setuptools-scm')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-maturin' 'python-setuptools-rust')
optdepends=('python-emoji: For compliant XEP-0444 support')
options=(!emptydirs)

source=("https://codeberg.org/poezio/${_pkgbase}/archive/slix-${pkgver}.tar.gz")
sha512sums=('01a7941abf107208fe94146328b8d6f5db029009ee98ca2dbe408083d3e8fb5cdf38a1f7bac41d1401727cd6d9a2e381e0b03b71a55be54770f7722832c829e8')
build() {
    cd $_pkgbase
    rm -f dist/*.whl
    SETUPTOOLS_SCM_PRETEND_VERSION_FOR_SLIXMPP=$pkgver python -m build --wheel --no-isolation
}

package() {
    cd $_pkgbase
    python -m installer --destdir="$pkgdir" dist/*.whl
}
