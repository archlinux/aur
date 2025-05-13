# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=mod-pitchshifter
pkgname=${_name,,}-git
pkgver=r245.efd26e6
pkgrel=1
pkgdesc="Pitch shifter lv2 effects from mod-audio"
arch=(aarch64 x86_64)
url="https://github.com/mod-audio/$_name"
license=(AGPLv2)
groups=(lv2-plugins)
makedepends=(armadillo git make python-mpmath)
provides=(mod-superwhammy.so
          mod-superwhammy.lv2
          mod-supercapo.so
          mod-supercapo.lv2
          mod-harmonizercs.so
          mod-harmonizercs.lv2
          mod-harmonizer2.so
          mod-harmonizer2.lv2
          mod-harmonizer.so
          mod-harmonizer.lv2
          mod-drop.so
          mod-drop.lv2
          mod-capo.so
          mod-capo.lv2
          mod-2voices.so
          mod-2voices.lv2)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name" || exit 1
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_name" || exit 1
  make
}

package() {
  cd "$srcdir/$_name" || exit 1
  make DESTDIR="$pkgdir/usr/lib/lv2" INSTALL_PATH="" install
}
