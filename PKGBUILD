
pkgname=nodejs-configurable-http-proxy
pkgver=5.1.0
pkgrel=1
pkgdesc="node-http-proxy plus a REST API"
url="https://github.com/jupyterhub/configurable-http-proxy"
arch=(any)
license=('BSD')
makedepends=('npm')
depends=('nodejs')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('2a8bda5a8fd42e4433e5be87de5ef539c96d1c75b5007bb7d7ceba14ba374b27')
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

