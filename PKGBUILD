# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.14.0
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
sha512sums=('8164677ab4f426793c09195adb003bb2697ca81a5754bd695c6dca56afed0de1c88db49944bc9e7e4e2d185af3aaf481d831b8f11e5b91dd8f7bbaacd1bf6101')
build() {
    cd $_pkgbase
    rm -f dist/*.whl
    SETUPTOOLS_SCM_PRETEND_VERSION_FOR_SLIXMPP=$pkgver python -m build --wheel --no-isolation
}

package() {
    cd $_pkgbase
    python -m installer --destdir="$pkgdir" dist/*.whl
}
