# Maintainer: LightDot <lightdot -a-t- server.si>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  antora-cli
  antora-site-generator
)
pkgver=3.1.15
pkgrel=1
pkgdesc="A modular site generator for documentation written in AsciiDoc."
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
sha256sums=('5707530ce5cc831b4b08ebd062f20c4b3e9ffb6fa8a29163afcdf5694cfda3b9'
            '8ed09f3f1e79133f55aa92c67016a47cfbb708a1a1bca2fc162d1721e4eb7ea2')

_package() {
  local file="$1"

  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$file"

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
