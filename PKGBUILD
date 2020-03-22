# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=uhhyou.lv2-git
pkgdesc="Vaious synth and effect LV2 plugins."
pkgver=r187.f65c308
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/ryukau/LV2Plugins"
license=(GPL)
groups=()
depends=()
makedepends=('jack' 'mesa' 'liblo' 'python-rdflib')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/ryukau/LV2Plugins)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd LV2Plugins
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd LV2Plugins
  git submodule update --init --recursive
  cp patch/NanoVG.cpp lib/DPF/dgl/src/NanoVG.cpp
}

build() {
  cd LV2Plugins
	make JACK=false VST2=false
}

package() {
  cd LV2Plugins/bin
  mkdir -p "$pkgdir"/usr/lib/lv2
  mv *.lv2 "$pkgdir"/usr/lib/lv2
}
