
pkgname=nodejs-configurable-http-proxy
pkgver=4.2.0
pkgrel=1
pkgdesc="node-http-proxy plus a REST API"
url="https://github.com/jupyterhub/configurable-http-proxy"
arch=(any)
license=('BSD')
makedepends=('npm')
depends=('nodejs')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('8d5842b5e086bea7d06406ecbbb33f9b0d897e55d3e62e35e69b2aa9497792dd')
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
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

