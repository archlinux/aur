# Maintainer: Milk Brewster (milk on freenode irc)
pkgname=bg-plugins.lv2-git
pkgver=r36.1eb55ff
pkgrel=1
epoch=
pkgdesc="CV arpeggiator and MIDI-pattern plugin developed for the MOD platform by Bram Geisen"
arch=('x86_64')
url="https://github.com/BramGiesen/arpeggiator_LV2"
license=('GPL')
groups=()
depends=('xorg-server' 'lv2')
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
source=("git+https://github.com/BramGiesen/arpeggiator_LV2")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

# prepare() {
# }

pkgver() {
  cd "$srcdir"/arpeggiator_LV2
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
 }


build() {
  cd "$srcdir"/arpeggiator_LV2
  make
}
 
# check() {
	# cd "$pkgname-$pkgver"
	# make -k check
# }

package() {
  mkdir -p "${pkgdir}"/usr/lib/lv2/bg-arpeggiator.lv2
  mkdir -p "${pkgdir}"/usr/lib/lv2/bg-midi-pattern.lv2
  cd "$srcdir"/arpeggiator_LV2
  make DESTDIR="${pkgdir}" install 
}
