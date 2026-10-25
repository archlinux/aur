# Maintainer: a821 at mail de
# Contributor: Reto <reto@sligthlybroken.com>
# Contributor: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria
pkgver=2026.10.18
pkgrel=1
pkgdesc="A robust, full-featured and user/programmer-friendly Python IRC bot"
arch=('any')
url="https://github.com/ProgVal/Limnoria"
license=('BSD-3-Clause')
depends=('python' 'python-setuptools')
makedepends=(python-build python-installer python-wheel)
optdepends=(
    'python-chardet: to detect encoding of incoming IRC lines, if they are not in UTF-8'
    'python-gnupg: for authenticated based on GPG tokens'
    'python-pysocks: for SOCKS proxy (typically used to connect to IRC via Tor)'
    'python-cryptography: required to load the Fediverse plugin (used to implement HTTP signatures)'
    'python-feedparser: required to load the RSS plugin'
    'python-sqlalchemy: Aka plugin support (fallbacks to sqlite3)'
    'python-dateutil: enable fancy time string parsing in the Time plugin'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/master-${pkgver//./-}.tar.gz")
sha256sums=('16ffcd4a979a1f9e1ba2a9b7f5f4de1144adc7415c08efb8dfa01b4d74d557d7')

prepare() {
    mv "Limnoria-master-${pkgver//./-}" "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
