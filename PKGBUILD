# Maintainer: yummiergravy <https://github.com/YummierGravy>

pkgname=chess-library-git
pkgver=0.r545.g5715961
pkgrel=1
pkgdesc="Disservin C++ chess rules library (header-only, git)"
arch=('any')
url="https://github.com/Disservin/chess-library"
license=('MIT')
makedepends=('git')
provides=('chess-library')
conflicts=('chess-library')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd chess-library
  local desc
  desc=$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  if [[ -n "$desc" ]]; then
    printf '%s' "$desc"
  else
    printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

package() {
  cd chess-library
  install -Dm644 include/chess.hpp "$pkgdir/usr/include/chess.hpp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
