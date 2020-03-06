# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=zchordz.lv2-git
pkgdesc="LV2 MIDI chord plugin."
pkgver=r6.2c7e121
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/zrythm/ZChordz"
license=(GPL)
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/zrythm/ZChordz)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd ZChordz
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ZChordz
  git submodule update --init

}

build() {
  cd ZChordz
	make
}

package() {
  mkdir -p $pkgdir/usr/lib/lv2
  cp -r ZChordz/bin/zchordz.lv2 $pkgdir/usr/lib/lv2
}
