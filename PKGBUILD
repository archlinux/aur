_npmname=mochawesome
pkgname=nodejs-$_npmname
pkgver=3.0.1
pkgrel=1
pkgdesc="Mochawesome is a custom reporter for use with the Javascript testing framework, mocha."
arch=(any)
url="https://github.com/adamgruber/mochawesome"
license=('MIT')
depends=('nodejs' 'nodejs-mocha')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('4f674b4c29e8307d9d87d12506258dbf7ed25b92b027b720dce7dc22106ca620')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  rm -r "$pkgdir"/usr/etc
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
