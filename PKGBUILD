# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=clean-css-cli
pkgname=nodejs-$_npmname
pkgver=5.3.2
pkgrel=1
pkgdesc="The command line interface to clean-css CSS optimizer"
arch=(any)
url=https://github.com/jakubpawlowicz/clean-css-cli
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('8f74b86660da38d9e52775aea5ac056c80fa30b450a3972f6ec5951ec11218ba')

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

# vim: set ts=2 sw=2 et:
