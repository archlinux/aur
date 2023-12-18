# Maintainer: redtide <redtid3@gmail.com>

_pkgname=wshot
pkgname=$_pkgname-git
pkgver=1.0.2.r9.g94c5ab9
pkgrel=1
pkgdesc="Screenshot GUI for wayland"
arch=(any)
url="https://github.com/stefonarch/$_pkgname"
license=(GPL3)
source=(git+$url)
sha512sums=(
  SKIP
)
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(
  git
)
depends=(
  grim
  slurp
  zenity
  jq
)

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir"/$_pkgname
  install -vDm 755 $_pkgname -t "$pkgdir"/usr/bin/
# install -vDm 644 $_pkgname.desktop -t "$pkgdir"/usr/share/applications/
  install -vDm 644 $_pkgname.png -t "$pkgdir"/usr/share/pixmaps/
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$_pkgname/
  install -vDm 644 wshot1.png -t "$pkgdir"/usr/share/doc/$_pkgname/
}
