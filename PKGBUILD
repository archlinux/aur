# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>

pkgname=hikarujs
pkgver=1.0.11
pkgrel=2
pkgdesc='A static site generator that generates routes based on directories naturally.'
arch=('any')
url='https://hikaru.alynx.moe/'
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('d273887454904061112d4e28fcf9ac9a65d07ea8d54fbcaa6ec8f853e461c234ed134cb0a917133996cf6af24ee2156f65c9b026d989ba027f053b43ea6adb7f')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$pkgname-$pkgver.tgz

  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
  install -Dm0644 \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

