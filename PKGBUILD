# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=postcss
pkgname=nodejs-$_npmname
pkgver=8.4.20
pkgrel=1
pkgdesc="Tool for transforming styles with JS plugins"
arch=(any)
url=https://postcss.org
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('b20e37e914a719235f409cba01dea163310aa7067a233037afb0c473b82ec3f1')

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
