# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file-cli
pkgver=2.6.3
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
sha256sums=('27405127a13c975291e60477bef9e286cdfab59e9f607e54b12de1d0fc09a2cf')

package() {
  cd $pkgname-$pkgver
  npm install \
    --global \
    --install-links \
    --prefix "$pkgdir/usr"

  # Remove files unnecessary at runtime
  rm \
    "$pkgdir/usr/lib/node_modules/single-file-cli/single-file" \
    "$pkgdir/usr/lib/node_modules/single-file-cli/build.sh" \
    "$pkgdir/usr/lib/node_modules/single-file-cli/compile.sh" \
    "$pkgdir/usr/lib/node_modules/single-file-cli/build-dev.sh"
  rm -r "$pkgdir/usr/lib/node_modules/single-file-cli/test"

  local moduledir="$pkgdir/usr/lib/node_modules/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$moduledir/README.MD"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$moduledir/LICENSE"
}
