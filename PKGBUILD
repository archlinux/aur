# Maintainer: Adrian Lopez <zeioth@hotmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=rofi-zeal
pkgname=$_pkgname-git
pkgver=1.0.3.r2.g1c6f0d3
pkgrel=1
pkgdesc='Search code documentation from rofi'
arch=(any)
url="https://github.com/Zeioth/rofi-zeal.git"
license=(MIT)
depends=(rofi zeal)
makedepends=(git)
optdepends=(
    'i3-wm: display man pages'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd $_pkgname
  install -vDm755 rofi-zeal.sh "$pkgdir"/usr/bin/$_pkgname
}
