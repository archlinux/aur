# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>

pkgname=hikarujs
pkgver=1.0.6
pkgrel=1
pkgdesc='A static site generator that generates routes based on directories naturally.'
arch=('any')
url='https://hikaru.alynx.moe/'
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('b4a62770857142804ea54cb1df0bc319d66f4243761ea4d5b7621803014b6b1f14a82669475f8085a72c87d6630dbd221458db655e1b953c035f72fe3d1a28d1')

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

