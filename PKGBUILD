# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file-cli
pkgver=2.0.83
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c031176b684c18abf80f0f4fda36a4acec3a2c352339ffb3a45b88da89e5bc8b')

package() {
  cd $pkgname-$pkgver
  npm install \
    --global \
    --install-links \
    --prefix "$pkgdir/usr"

  # Remove unnecessary scripts to silence namcap warnings
  rm \
    "$pkgdir/usr/lib/node_modules/single-file-cli/single-file" \
    "$pkgdir/usr/lib/node_modules/single-file-cli/build.sh" \
    "$pkgdir/usr/lib/node_modules/single-file-cli/compile.sh" \
    "$pkgdir/usr/lib/node_modules/single-file-cli/dev-build.sh"

  local moduledir="$pkgdir/usr/lib/node_modules/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$moduledir/README.MD"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$moduledir/LICENSE"
}
