# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=mystery.lv2-git
pkgdesc="MYSTERY CURVE"
pkgver=r47.066164d
pkgrel=1
epoch=
arch=(x86_64)
url="https://gitlab.com/OpenMusicKontrollers/mystery.lv2"
license=(GPL)
groups=(lv2-plugins)
depends=(lv2)
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
source=(mystery.lv2-git::git+https://gitlab.com/OpenMusicKontrollers/mystery.lv2)
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
  meson build --prefix=/usr
}

build() {
	cd "$pkgname/build"
	# ./configure --prefix=/usr
  ninja
}

package() {
	cd "$pkgname/build"
 DESTDIR="$pkgdir/" ninja install
}
