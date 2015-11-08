# Maintainer: Dylan <dylan@flickmag.net>

pkgname='flickmagnet'
_gitname='flickmagnet'
pkgver='0.0.2'
pkgrel=1
pkgdesc='HTTP server similar to Netflix and PopcornTime which streams public domain videos from torrent files.'
arch=('any')
url='https://github.com/acerix/flickmagnet'
license=('MIT')

depends=(
    'python'
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
    'SKIP'
    '75566e170c89ed9638d9178e7c15a7bd8fad2f53222545c973e72642e5c1704e'
)

package() {
    cd "$_gitname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname/examples/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

