# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>

pkgname=hikarujs
pkgver=1.0.9
pkgrel=1
pkgdesc='A static site generator that generates routes based on directories naturally.'
arch=('any')
url='https://hikaru.alynx.moe/'
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('0bc17b0f9137954bfad774743fe72bc0a6239551212e0ae9ec9db2622ebdeb38670d2c5d277ee69e8a54a803a7a6af9ee56b0011bb09eb32f8e13e0f57e2d4dc')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$pkgname-$pkgver.tgz

  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  chmod -R 0755 "$pkgdir"
  chown -R root:root "$pkgdir"
  install -Dm0644 \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

