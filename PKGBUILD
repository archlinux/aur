# Maintainer: Reto <reto@sligthlybroken.com>
# Contributor: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria
pkgver=2024.8.26
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
sha256sums=('5f536f9bb6dc7301e7f4a20a42e45bfa62f353011d7a22cd933cb129ad8993c6')

build() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl
}
