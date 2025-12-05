# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=access-irc
pkgver=1.5.0
pkgrel=1
pkgdesc="Accessible IRC client with GTK3 and screen reader support"
arch=('any')
url="https://github.com/destructatron/access-irc"
license=('MIT')
depends=('python' 'python-gobject' 'python-miniirc' 'gtk3' 'at-spi2-core'
         'gst-plugins-base' 'gst-plugins-good' 'gspell')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-numpy: for sound generation'
            'python-scipy: for sound generation')
source=("$pkgname-$pkgver.tar.gz::https://github.com/destructatron/access-irc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dae0136ef588836782c10034813934856c62f31e7813f6c77e6b1928bc258bee')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
