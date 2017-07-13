
pkgname=nodejs-configurable-http-proxy
pkgver=2.0.4
pkgrel=1
pkgdesc="node-http-proxy plus a REST API"
url="https://github.com/jupyter/configurable-http-proxy"
arch=(any)
license=('BSD')
makedepends=('npm')
depends=('nodejs')
source=("https://github.com/jupyter/configurable-http-proxy/archive/${pkgver}.tar.gz")
sha256sums=('fee6ce0a8f93288cc47a19498a51fcca050da54c166b3c3ea30032f8241045e8')
_npmname=configurable-http-proxy

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  rm -rf "$pkgdir/usr/etc"
  chown -R root:root "$pkgdir/usr"
  cd "$srcdir/$_npmname-$pkgver"
  install -Dm644 COPYING.md "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.md
}

