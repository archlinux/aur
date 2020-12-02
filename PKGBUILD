# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=spectacle-analyzer.lv2-git
pkgdesc="Realtime graphical spectrum analyzer."
pkgver=v1.0.r5.g1c08616
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/jpcima/spectacle"
license=()
groups=(lv2-plugins)
depends=('cairo' 'lv2')
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
source=(spectacle.lv2-git::git+https://github.com/jpcima/spectacle)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd spectacle.lv2-git
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd spectacle.lv2-git
  git submodule update --init --recursive
}

build() {
  cd spectacle.lv2-git
	# ./configure --prefix=/usr
	make
}

package() {
  cd spectacle.lv2-git
	make DESTDIR="$pkgdir/" PREFIX=/usr BUILD_VST2=false BUILD_JACK=false install
}
