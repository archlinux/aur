# Maintainer: Adam Wahab <awahab@adhoc.tools>

_name=mod-pitchshifter
pkgname=${_name,,}-git
pkgver=r245.efd26e6
pkgrel=1
pkgdesc="Pitch shifter lv2 effects from mod-audio"
url="https://github.com/mod-audio/mod-pitchshifter"
arch=(aarch64 x86_64)
license=(AGPLv2)
makedepends=(armadillo make python-mpmath)
provides=($_name)
groups=(lv2-plugins pro-audio)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_name" || exit 1
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$_name" || exit 1
  make
}

package() {
  cd "${srcdir}/$_name" || exit 1
  make DESTDIR="${pkgdir}/usr/lib/lv2" INSTALL_PATH="" install
}
