# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=catppuccin-kde-theme-git
pkgver=r39.ee77015
pkgrel=1
pkgdesc="Soothing pastel theme for KDE"
url="https://github.com/catppuccin/kde"
license=('MIT')
arch=('any')
makedepends=('kpackage')
source=("$pkgname::git+https://github.com/catppuccin/kde.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  install -Dm0644 -t "$pkgdir/usr/share/color-schemes" $(find . -type f -name '*.colors')
  find . -type f -name '*.tar.gz' -exec kpackagetool5 -p "$pkgdir/usr/share/plasma/look-and-feel" -i '{}' \;

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
