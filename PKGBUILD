# Maintainer: mirsella <mirsella@protonmail.com>

pkgname=plasma6-applets-codexbar-git
_pkgname=codexbar-plasmoid
_plasmoid=com.github.psimaker.codexbar
pkgver=0.3.1.r6.g7f619f5
pkgrel=1
pkgdesc='KDE Plasma 6 panel widget for AI coding-provider usage (development version)'
arch=('any')
url='https://github.com/mirsella/codexbar-plasmoid'
license=('MIT')
depends=('libplasma' 'plasma5support' 'ksvg' 'kcmutils' 'kirigami'
         'qt6-declarative' 'codexbar-cli')
makedepends=('git')
provides=('plasma6-applets-codexbar')
conflicts=('plasma6-applets-codexbar')
install="$pkgname.install"
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"

  local _dest="$pkgdir/usr/share/plasma/plasmoids/$_plasmoid"
  install -dm755 "$_dest"
  cp -a contents "$_dest/"
  install -Dm644 metadata.json "$_dest/metadata.json"
  find "$_dest/contents" -type d -exec chmod 755 {} +
  find "$_dest/contents" -type f -exec chmod 644 {} +

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
