# Maintainer: Adam Wahab <awahab@adhoc.tools>

_name=mod-pitchshifter
pkgname=${_name,,}-git
pkgver=r245.efd26e6
pkgrel=1
pkgdesc="Pitch shifter lv2 effects from mod-audio"
url="https://github.com/mod-audio/mod-pitchshifter"
arch=(aarch64 x86_64)
# https://github.com/mod-audio/mod-pitchshifter/issues/11
license=(AGPLv2)
makedepends=(make armadillo python-mpmath)
provides=($_name)
groups=(lv2-plugins pro-audio)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_name"
	make
}

package() {
	cd "$_name"
	make DESTDIR="${pkgdir}/usr/lib/lv2" INSTALL_PATH="" install
}
