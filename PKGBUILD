# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.18.0
pkgrel=1
pkgdesc="An XMPP library written for Python 3 (SleekXMPP asyncio fork)"
arch=('x86_64' 'armv7h' 'aarch64' 'powerpc')
url="https://codeberg.org/poezio/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'python-aiohttp')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-rust' 'python-setuptools-scm')
optdepends=('python-emoji: For compliant XEP-0444 support')
options=(!emptydirs)

source=("https://codeberg.org/poezio/${_pkgbase}/archive/slix-${pkgver}.tar.gz")
sha512sums=('173324cbf8dfae925e1e34b6174112f7aa5dbb487621c0fa1155f91cd512f70457c99525bc921710d80f21ec3f5ff7da925fe2c1a1d60377130e6c6813db52e2')
build() {
    cd $_pkgbase
    rm -f dist/*.whl
    SETUPTOOLS_SCM_PRETEND_VERSION_FOR_SLIXMPP=$pkgver python -m build --wheel --no-isolation
}

package() {
    cd $_pkgbase
    python -m installer --destdir="$pkgdir" dist/*.whl
}
