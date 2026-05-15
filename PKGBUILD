# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp-git
pkgver=1.15.0.r7.g853c77f
pkgrel=1
pkgdesc="An XMPP library written for Python 3 (SleekXMPP asyncio fork)"
arch=('x86_64' 'armv7h' 'aarch64' 'powerpc')
url="https://codeberg.org/poezio/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-rust' 'python-setuptools-scm')
optdepends=('python-emoji: For compliant XEP-0444 support')
provides=('python-slixmpp')
conflicts=('python-slixmpp')
options=(!emptydirs)

source=("git+https://codeberg.org/poezio/slixmpp.git")
md5sums=('SKIP')

pkgver() {
    cd slixmpp
    git describe --long --abbrev=7 | sed 's/^slix-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd slixmpp
    python -m build --wheel --no-isolation
}

package() {
    cd slixmpp
    python -m installer --destdir="$pkgdir" dist/*.whl
}
