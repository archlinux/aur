maintainer="Milk Brewster (milkii on Freenode)"
pkgname=mod-step-sequencer.lv2-git
pkgver=r35.602c71e
pkgrel=1
pkgdesc="A step sequencer that works with live MIDI input (alpha)"
#epoch=0
arch=('i686' 'x86_64')
url="https://github.com/moddevices/mod-step-sequencer-lv2"
license=()
groups=(lv2-plugins)
depends=(lv2)
makedepends=(git)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/moddevices/mod-step-sequencer-lv2")
noextract=()
md5sums=('SKIP')
#sha1sums=()
#sha256sums=()
#sha384sums=()
#sha512sums=()

pkgver() {
  cd "${srcdir}/mod-step-sequencer-lv2"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare()
{
  cd "$srcdir/mod-step-sequencer-lv2"
  git submodule update --init --recursive

}

build() {
  cd "$srcdir/mod-step-sequencer-lv2"
}

package() {
  mkdir -p ${pkgdir}/usr/lib/lv2
  cd "$srcdir/mod-step-sequencer-lv2/bin"
  cp -r mod-step-sequencer.lv2 ${pkgdir}/usr/lib/lv2
}

# vim:set ts=2 sw=2 et:
