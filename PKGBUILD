# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=midi-trigger.lv2-git
pkgdesc="LV2 plugin which generates MIDI notes by detected audio signal peaks."
pkgver=r38.83c4ad6
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/metachronica/audio-dsp-midi-trigger"
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
source=(midi-trigger.lv2-git::git+https://github.com/metachronica/audio-dsp-midi-trigger)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	# ./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"/build
  mkdir -p ${pkgdir}/usr/lib/lv2
  mv midi-trigger.lv2 ${pkgdir}/usr/lib/lv2
}
