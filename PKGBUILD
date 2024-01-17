# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file
_name=single-file-cli
pkgver=1.1.47
pkgrel=2
pkgdesc="CLI tool for saving a faithful copy of a complete web page in a single HTML file"
arch=(any)
url="https://github.com/gildas-lormeau/single-file-cli"
license=(AGPL-3.0-or-later)
depends=(nodejs)
makedepends=(npm)
optdepends=(
  'chromium: for webdriver-chromium backend'
  'playwright: for playwright-{firefox,chromium} backend'
)

source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
noextract=("$_name-$pkgver.tgz")
sha256sums=('85cfb06d1f83106ae9fecd887046ef3b1e847c4c0709aaae203700895a89656a')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$_name-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$_name/README.MD"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$_name/LICENSE"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
