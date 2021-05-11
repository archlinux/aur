# Maintainer: Darks <l.gatin@protonmail.com>
pkgname="gint-devel-git"
pkgver=2.4.1
pkgrel=1
pkgdesc='Set of tools and libraries based on gcc, fxsdk and gint to build native programs for Casio calculators'
arch=('i686' 'x86_64')
depends=('gint')
makedepends=('fxsdk' 'gint')
license=('unkwown')
source=("libprof::git+https://gitea.planet-casio.com/Lephenixnoir/libprof.git"
        "libimg::git+https://gitea.planet-casio.com/Lephenixnoir/libimg.git"
        "justui::git+https://gitea.planet-casio.com/Lephenixnoir/JustUI.git")
sha256sums=("SKIP" "SKIP" "SKIP")
options=("!strip")
_libraries=$(for i in "${source[@]}"; do echo $i | cut -d: -f1; done)

prepare() {
  for i in ${_libraries[@]}; do
    cd "$srcdir/${i}"
    fxsdk build-fx -c
    fxsdk build-cg -c
  done
}

build() {
  for i in ${_libraries[@]}; do
    cd "$srcdir/${i}"
    fxsdk build-fx
    fxsdk build-cg
  done
}

package() {
  for i in ${_libraries[@]}; do
    cd "$srcdir/${i}"
    fxsdk build-fx DESTDIR="$pkgdir" install
    fxsdk build-cg DESTDIR="$pkgdir" install
  done
}
