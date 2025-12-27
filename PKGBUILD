# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=access-irc
pkgver=1.6.0
pkgrel=1
pkgdesc="Accessible IRC client with GTK3 and screen reader support"
arch=('any')
url="https://github.com/destructatron/access-irc"
license=('MIT')
depends=('python' 'python-gobject' 'python-miniirc' 'python-pluggy' 'gtk3' 'at-spi2-core'
         'gst-plugins-base' 'gst-plugins-good' 'gspell')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-numpy: for sound generation'
            'python-scipy: for sound generation')
source=("$pkgname-$pkgver.tar.gz::https://github.com/destructatron/access-irc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e037c173a6095840fccf240710129c72c89a678ca95267ace8fc75c40d5c083')

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
