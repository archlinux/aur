# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  antora-cli
  antora-site-generator
)
pkgver=3.1.7
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
  '6008d09edf20e4763946e803149013af8b75416357111155e21aefba0efdce85'
  '1c414527c0ada92041dbc6d5db5d6c870b07d47c643efb5655171406fd258c23'
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
