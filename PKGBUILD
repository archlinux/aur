# Maintainer: Gaou Piou <i.am.piou@gmail.com>

_pkgname=gruppled-svg
pkgname=gruppled-svg-cursor-theme-git
pkgver=r4.9952fc7
pkgrel=1
pkgdesc="Vector (SVG) redraw of the Gruppled cursor theme, black and white variants (Plasma 6.2+ scalable and Xcursor)"
arch=('any')
url="https://github.com/3zet/gruppled-svg"
license=('GPL-2.0-only')
optdepends=('breeze: fallback cursors for shapes missing from the theme (index.theme Inherits=breeze_cursors)')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip' '!debug')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"
  install -dm755 "$pkgdir/usr/share/icons"
  # Themes are shipped prebuilt (SVG + Xcursor); cp -a keeps the alias symlinks.
  local t
  for t in gruppled_black gruppled_white; do
    cp -a "$t" "$pkgdir/usr/share/icons/$t"
    rm -f "$pkgdir/usr/share/icons/$t/COPYING"
  done
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
