
pkgname=nodejs-configurable-http-proxy
pkgver=4.5.6
pkgrel=1
pkgdesc="node-http-proxy plus a REST API"
url="https://github.com/jupyterhub/configurable-http-proxy"
arch=(any)
license=('BSD')
makedepends=('npm')
depends=('nodejs')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('4d9d94d0e6e44542ac973963b8a6545f4b40c0a2995e865ae9c80a2279e1e0ab')
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

