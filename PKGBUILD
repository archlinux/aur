# Maintainer: Reto <reto@sligthlybroken.com>
# Contributor: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria
pkgver=2023.9.24
pkgrel=1
pkgdesc="A robust, full-featured and user/programmer-friendly Python IRC bot"
arch=('any')
url="https://github.com/ProgVal/Limnoria"
license=('BSD')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=(
'python-chardet: to detect encoding of incoming IRC lines, if they are not in UTF-8'
'python-gnupg: for authenticated based on GPG tokens'
'python-pysocks: for SOCKS proxy (typically used to connect to IRC via Tor)'
'python-cryptography: required to load the Fediverse plugin (used to implement HTTP signatures)'
'python-feedparser: required to load the RSS plugin'
'python-dateutil: enable fancy time string parsing in the Time plugin'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5495c8b86720c0010e6c209a87ec9cfe8dc81297b8967e45e305700b2e7802e7')

build() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl
}
