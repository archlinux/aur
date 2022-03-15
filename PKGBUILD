# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=markdown-link-check
pkgver=3.9.3
pkgrel=2
pkgdesc="checks that all of the hyperlinks in a markdown text to determine if they are alive or dead"
arch=('any')
url="https://github.com/tcort/markdown-link-check"
license=('ICS')
depends=('nodejs')
makedepends=('npm')

source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('9c1f0ebc30661523e0093e8100c78da2bbe8676f3e601b1abc146f949f243b0c')

package() {
    npm install -g \
      --cache "$srcdir/npm-cache" \
      --prefix "$pkgdir/usr" \
      "$srcdir/$pkgname-$pkgver.tgz"
    install -Dm644 \
      "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE.md" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
