# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=screcord.lv2-git
pkgdesc="A mono and a stereo audio capture LV2 plugin."
pkgver=r25.e11a771
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/brummer10/screcord.lv2"
license=(GPL)
groups=(lv2-plugins)
depends=(libsndfile)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(debug !strip)
install=
changelog=
source=(git+https://github.com/brummer10/screcord.lv2)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "screcord.lv2"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "screcord.lv2"
  git submodule init
  git submodule update
}

build() {
  cd "screcord.lv2"
	# ./configure --prefix=/usr
  make
}

package() {
  cd "screcord.lv2"
  make DESTDIR="$pkgdir" install
}
