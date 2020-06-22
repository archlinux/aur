# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>
# Contributor: DetMittens
# Based on PKGBUILD Maintained by: Ondrej Jirman <megous@megous.com>

pkgname=megatools-git
pkgver=1.10.1.r80.g9e47ad4
pkgrel=1
pkgdesc="Command line client application for Mega.nz"
arch=('i686' 'x86_64' 'armv7h')
url="http://megatools.megous.com"
license=('GPL')
depends=('curl' 'glib2')
provides=('megatools')
conflicts=('megatools')
makedepends=('git' 'asciidoc' 'docbook2x' 'meson')
source=("git+https://megous.com/git/megatools")
sha256sums=('SKIP')

pkgver() {
  cd "megatools"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson ../megatools --prefix=/usr
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
