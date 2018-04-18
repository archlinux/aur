# Maintainer: Dylan <dylan@psilly.com>

pkgname='flickmagnet'
pkgver='0.0.8'
pkgrel=1
pkgdesc='HTTP server for streaming public domain videos from torrent files to your web browser.'
arch=('any')
url='https://github.com/acerix/flickmagnet'
license=('MIT')

depends=(
  'btfs'
  'python-xdg'
  'python-daemonocle'
  'python-toml'
  'python-cherrypy'
  'python-mako'
)

install=flickmagnet.install
source=(
  "$url/archive/$pkgver.tar.gz"
  flickmagnet.install
)
sha256sums=(
  '129797abd36c39a9f55338cdb29e648b19e799667e9526b1e2b5287f4cf00c0f'
  '0a8d9d8e940c280c8038f4fdb35a036fd89e658ff26d3e1ce68d8787c1ce2970'
)
build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=2
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -dm700 "$pkgdir/srv/$pkgname"
  install -Dm644 "$pkgname/examples/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

