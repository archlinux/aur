# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=standard
pkgver=16.0.3
pkgrel=1
pkgdesc="JavaScript style guide, linter, and formatter"
arch=('any')
url="https://standardjs.com"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
replaces=('nodejs-standard')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('65f7ea268608abc77172a4149bc6b39059f0a05c17ee2fa53136bde1ea2ca884491ad0db0e1a9779493f90e1ab8a974cca7b6aa93eded65c926ac0d020e76ad4')

package() {
  local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)

  npm install \
    --global \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" \
    "${NPM_FLAGS[@]}" \
    "$pkgname-$pkgver.tar.gz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$pkgname/"*.md
}
