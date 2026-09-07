# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=postcss-cli
pkgname=nodejs-$_npmname
pkgver=12.0.0
pkgrel=1
pkgdesc="CLI for postcss"
arch=(any)
url=https://github.com/postcss/postcss-cli
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('3d06063483b1984cd8d1c2496f610e505a0cd9e4dbe46019c029cb2ba92a9696')

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
