# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.15.0
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
sha512sums=('6fda8b736865cf9b62891a3a390ee59c14dfc5dd86ed469a33d154913e1c34b4fdf1cd396adc60a89c52a50d4a6ee903c63e1d0bb3c98f4eff456cc8d2e45241')
build() {
    cd $_pkgbase
    rm -f dist/*.whl
    SETUPTOOLS_SCM_PRETEND_VERSION_FOR_SLIXMPP=$pkgver python -m build --wheel --no-isolation
}

package() {
    cd $_pkgbase
    python -m installer --destdir="$pkgdir" dist/*.whl
}
