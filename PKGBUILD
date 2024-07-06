# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  antora-cli
  antora-site-generator
)
pkgver=3.1.9
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
  '733372f9dde053ce9e177bb0c04bd39accc575d923f0d8934a11606f17757c80'
  'dbfc20be3a8eb5ffbfa5de55b5d51c90b7d7952c8394f21d5856180b6a3b9069'
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
