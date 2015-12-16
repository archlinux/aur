# Maintainer: Dylan <dylan@flickmag.net>

pkgname='flickmagnet'
_gitname='flickmagnet'
pkgver='0.0.6'
pkgrel=1
pkgdesc='HTTP server similar to Netflix and PopcornTime which streams public domain videos from torrent files.'
arch=('any')
url='https://github.com/acerix/flickmagnet'
license=('MIT')

depends=(
    'python-xdg'
    'python-daemonocle'
    'python-libtorrent-rasterbar'
    'python-pytoml'
    'python-cherrypy'
    'python-mako'
    'python-requests'
    'python-beautifulsoup4'
)

install=flickmagnet.install
source=(
    "$url/archive/$pkgver.tar.gz"
    flickmagnet.install
)
sha256sums=(
    '54f096471a2194a03acfd5f15ebe7e2ba87f9fa3ebbb1c93aa13ed7361edbd0d'
    '767f3921d18eae1a414cfcc23c74784ec5d4888feea5cf3ff7fc80e92d435b58'
)
build() {
    cd "$_gitname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=2
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -dm700 "$pkgdir/srv/$pkgname"
    install -Dm644 "$pkgname/examples/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
