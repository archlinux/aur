# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=spectacle.lv2-git
pkgdesc="Realtime graphical spectrum analyzer."
pkgver=v1.0.r1.ga47fd22
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
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
  git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	# ./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" PREFIX=/usr BUILD_VST2=false BUILD_JACK=false install
}
