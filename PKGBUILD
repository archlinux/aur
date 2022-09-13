# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=postcss-cli
pkgname=nodejs-$_npmname
pkgver=10.0.0
pkgrel=1
pkgdesc="CLI for postcss"
arch=(any)
url=https://github.com/postcss/postcss-cli
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('09b89ec17a0ee017b3bef809041e2cb50498e7822a72a6eeb1b78cb537d6ec0f')

package() {
  npm install --global \
    --cache "$srcdir/.npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
