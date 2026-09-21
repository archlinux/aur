# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file-cli
pkgver=2.15.2
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
sha256sums=('53c0ef71ebd2bb41f21a8b954c52e40ad66608ffe0f0ba5d8c29bfe2f4e644a1')

package() {
  cd $pkgname-$pkgver
  npm install \
    --global \
    --install-links \
    --prefix "$pkgdir/usr"

  # Remove files unnecessary at runtime
  rm \
    "$pkgdir/usr/lib/node_modules/single-file-cli/single-file"

  local moduledir="$pkgdir/usr/lib/node_modules/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$moduledir/README.MD"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$moduledir/LICENSE"
}
