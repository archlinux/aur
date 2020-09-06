pkgname=po2lmo-git
_pkgname=po2lmo
pkgver=r1.750179b
pkgrel=1
pkgdesc="Openwrt po2lmo"
arch=('any')
url="https://github.com/openwrt-dev/po2lmo.git"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/openwrt-dev/po2lmo.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$pkgname"
  make
  install -m 755 src/po2lmo -D ${pkgdir}/usr/bin/po2lmo
}
