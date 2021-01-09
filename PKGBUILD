# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=postcss-cli
pkgname=nodejs-$_npmname
pkgver=8.3.1
pkgrel=1
pkgdesc="CLI for postcss"
arch=(any)
url=https://github.com/postcss/postcss-cli
license=(MIT)
depends=(nodejs nodejs-postcss)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('3c9f4951456d7a58d664ffbd4684895265ca4f6f5cb32d6fba9735bdfa2ce635')

package() {
  npm install \
    --cache "$srcdir/.npm-cache" \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
