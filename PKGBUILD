# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=standard
pkgver=16.0.4
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
sha512sums=('d80188f3be11342956e3151d33e6e0d4b45756560bcd33449079931b99a1ca7e393a16e0c00fbace7a3090e198cbe58c6f91d1c842efb4dcb7f6471d31031c61')
b2sums=('6eb93b00d7f0c08ea001d1798a8d94f592a05d7a4f41a93685276fefc70a43307f4f559a53aa2bc38fc5773663e0c60d9286109184cc2c7b4f92fe2f96765d2b')

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
