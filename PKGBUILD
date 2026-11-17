# Maintainer: LightDot <lightdot -a-t- server.si>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  'antora-cli'
  'antora-site-generator'
)
pkgver=3.2.3
pkgrel=1
pkgdesc="A modular site generator for documentation written in AsciiDoc."
arch=('any')
url="https://antora.org/"
license=('MPL-2.0')
depends=(
  'git'
  'nodejs'
)
makedepends=(
  'npm'
)
source=(
  "$pkgbase-cli-$pkgver.tar.gz::https://registry.npmjs.org/@$pkgbase/cli/-/cli-$pkgver.tgz"
  "$pkgbase-site-generator-$pkgver.tar.gz::https://registry.npmjs.org/@$pkgbase/site-generator/-/site-generator-$pkgver.tgz"
)
noextract=(
  "cli-$pkgver.tgz"
  "site-generator-$pkgver.tgz"
)
sha256sums=('37fa4f8d9a121e556054d569fe0af4e897d77347c632f20751b56b84e76db359'
            '3e23856f561767acda03568c044b35313702045eae222e172e907a70c98f96b9')

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
