# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=markdown-link-check
pkgver=3.10.2
pkgrel=1
pkgdesc="Checks aliveness of hyperlinks in markdown documents"
arch=('any')
url="https://github.com/tcort/markdown-link-check"
license=('ICS')
depends=('nodejs')
makedepends=('npm')

source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f780e1981804cf6d32c4465891c2d04c4c1ba58e7f7df4803a703555b26b87ab')

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
