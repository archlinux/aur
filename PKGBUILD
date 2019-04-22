# Maintainer: Milk Brewster <milk on freenode>
_pkgname=plujain-ramp
pkgname=${_pkgname}-git
pkgver=r47.9568cc9
pkgrel=1
pkgdesc="Mono rhythmic tremolo LV2 plugin with no GUI"
arch=(x86_64)
url="https://github.com/Houston4444/plujain-ramp"
license=('GPL')
groups=()
depends=('lv2')
makedepends=('git')
provides=('plujain-ramp' 'plujain-ramp-git')
conflicts=('plujain-ramp' 'plujain-ramp-git')
install=
source=('git+https://github.com/Houston4444/plujain-ramp')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/plujain-ramp"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/plujain-ramp"
}

build() {
  cd "$srcdir/plujain-ramp"
	make clean && make
}

package() {
  cd "$srcdir/plujain-ramp"
  make INSTALL_PATH=${pkgdir}/usr/lib/lv2 install
}
