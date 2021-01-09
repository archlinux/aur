# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=pug-cli
pkgname=nodejs-$_npmname
_pkgver=1.0.0-alpha6
pkgver=1.0.0alpha6
pkgrel=2
pkgdesc="Pug's CLI interface"
arch=(any)
url=https://pugjs.org
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_pkgver.tgz)
noextract=($_npmname-$_pkgver.tgz)
sha256sums=('1fc476f744776a477bfce64b88633176a84b3fd00a34cc3a3499a9aed2acca25')

package() {
  npm install \
    --cache "$srcdir/.npm-cache" \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$_pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
