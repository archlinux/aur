# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=zlfo.lv2-git
pkgdesc="Fully featured LFO for CV-based automation"
pkgver=r32.d0ec3d2
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/zrythm/ZLFO"
license=(GPL)
groups=(lv2-plugins)
depends=("glib2" "librsvg" "cairo")
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
source=(git+https://git.zrythm.org/git/ZLFO)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "ZLFO"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "ZLFO"
  meson build --prefix /usr
}

build() {
  cd "ZLFO"
	# ./configure --prefix=/usr
  ninja -C build
}

package() {
  cd "ZLFO"
  DESTDIR="$pkgdir/" ninja -C build install
}
