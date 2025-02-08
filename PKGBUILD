# Maintainer: tuberry

pkgname=fortune-mod-mingju-git
_pkg=mingju
_git=chinese-gushiwen
pkgver=r16.34956ae
pkgrel=1
pkgdesc="Chinese mingju for fortune-mod"
url="https://github.com/caoxingyu/$_git"
license=(GPL-3.0-or-later)
depends=(fortune-mod)
makedepends=(git fortune-mod jq)
provides=(fortune-mod-mingju)
conflicts=(fortune-mod-mingju)
source=("git+$url")
md5sums=('SKIP')
arch=(any)

pkgver() {
  cd "$_git"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_git"
  jq -r '.name + "\n ──── " + .from + "\n%"' <sentence/sentence1-10000.json >$_pkg
  strfile "$_pkg" "$_pkg.dat"
}

package() {
  cd "$_git"
  install -dm755 "$pkgdir/usr/share/fortune"
  install -Dm644 "$_pkg" "$_pkg.dat" "$pkgdir/usr/share/fortune"
}

# vim: ts=2 sw=2 et:
