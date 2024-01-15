# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Hao Long <aur@esd.cc>

pkgname=mercury-parser
_name=parser
pkgver=2.2.3
pkgrel=2
pkgdesc="Extract meaningful content from the chaos of a web page (@postlight version)"
arch=(any)
url="https://github.com/postlight/parser"
license=(Apache-2.0)
depends=(nodejs)
makedepends=(
  git
  npm
)

source=("https://registry.npmjs.org/@postlight/$_name/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('1aeea735458b89956608a0b3231d882cee73a3319f9bc10a6332b9ad553e829b')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$_name-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgdir/usr/lib/node_modules/@postlight/$_name/"*.md

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
