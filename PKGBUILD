# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=lfo-blender.lv2-git
pkgdesc="An LV2 plugin with 4 LFOs and 5 CV outputs."
pkgver=r7.0d9fab3
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/BramGiesen/cv-lfo-blender-lv2"
license=(GPL)
groups=(lv2-plugins)
depends=('lv2')
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
source=("lfo-blender.lv2-git::git+https://github.com/BramGiesen/cv-lfo-blender-lv2"
        "dpf::git+https://github.com/DISTRHO/DPF")
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
  git submodule init
  git submodule update
}

build() {
	cd "$pkgname"
	# ./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
