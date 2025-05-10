# Maintainer: Adam Wahab <awahab@adhoc.tools>

_name=loopor
pkgname=${_name}-git
pkgver=r38.a55eed7
pkgrel=1
pkgdesc="Looper plugin for LV2, specifically for the Mod Devices pedal board."
url="https://github.com/stevie67/$_name"
arch=(x86_64)
license=(MIT)
makedepends=(make)
provides=($_name.lv2)
groups=(lv2-plugins pro-audio)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_name" || exit 1
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_name/$_name-lv2/source" || exit 1
  make 
}

package() {
  cd "$_name/$_name-lv2/source" || exit 1
  make DESTDIR="${pkgdir}/usr" PREFIX="" install
}
