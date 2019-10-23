# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>

pkgname=hikarujs
pkgver=1.0.5
pkgrel=1
pkgdesc='A static site generator that generates routes based on directories naturally.'
arch=('any')
url='https://gtihub.com/AlynxZhou/hikaru/'
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('c789435fb233437c8ee5bfe840378b7dd4415832f82e579bbd83637a8e3d38b28c6bef1d630e7492440af36623f74ccc992a9769118bc37a2953bd3673bde1e3')

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

sha512sums=('dfb00b1e51fb3fbb5a2a12d9dbbf87a77c056cd183c93493cafe30948a1f768ab0a77a6bfe68a75f1229617d9d63ebf2979b2556b076138390c747ea1f025fe6')
