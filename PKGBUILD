# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=clean-css
pkgname=nodejs-$_npmname
pkgver=4.1.9
pkgrel=1
pkgdesc="A fast, efficient, and well tested CSS minifier for node.js."
arch=('any')
url="https://github.com/jakubpawlowicz/clean-css"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('a474469c4af681b798f5e9a6e97c1309a3124ad333e4e6f562ab8b3f8f19e04d')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  rm -r "$pkgdir"/usr/etc
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
