# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  antora-cli
  antora-site-generator
)
pkgver=3.1.8
pkgrel=1
pkgdesc="A modular documentation site generator"
arch=(any)
url="https://antora.org"
license=(MPL-2.0)
depends=(nodejs)
makedepends=(npm)
source=(
  "$pkgbase-cli-$pkgver.tar.gz::https://registry.npmjs.org/@$pkgbase/cli/-/cli-$pkgver.tgz"
  "$pkgbase-site-generator-$pkgver.tar.gz::https://registry.npmjs.org/@$pkgbase/site-generator/-/site-generator-$pkgver.tgz"
)
noextract=(
  "cli-$pkgver.tgz"
  "site-generator-$pkgver.tgz"
)
sha256sums=(
  '941b95d7b0f5f74bbf2198f7a3dd6bd74020ea060cd1be744f6994ec831fc554'
  '5afc31670862c5b6c6ca23fe0e8ef998899fc303c52cd8ad0cd221c42f6f3bcf'
)

_package() {
  _file="$1"

  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$_file"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}

package_antora-cli() {
  _package "$pkgbase-cli-$pkgver.tar.gz"
}

package_antora-site-generator() {
  _package "$pkgbase-site-generator-$pkgver.tar.gz"
}
