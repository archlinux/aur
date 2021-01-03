# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=express-generator
pkgname=nodejs-$_npmname
pkgver=4.16.1
pkgrel=1
pkgdesc="Express' application generator"
arch=(any)
url=http://expressjs.com
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('130030d5df75bb8421c3e1e399f089f9436c9abe12b65ffe351f6def4948eeeb')

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

# vim: set ts=2 sw=2 et:
