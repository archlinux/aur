# Maintainer: LightDot <lightdot -a-t- server.si>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  'antora-cli'
  'antora-site-generator'
)
pkgver=3.2.1
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
sha256sums=('e43d5d9bdb6652791262fef1c254d8edcaec8fc97ba12f52023aab04f6102dc5'
            'd70969d0e309db8483f4e71ed92d5aa92cb37b9ef054fe0c178e5dfdc202666b')

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
