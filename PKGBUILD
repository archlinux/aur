# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=fogpad.lv2-git
pkgdesc="A reverb where reflections can be frozen, filtered, pitch shifted and disintegrated."
pkgver=v1.0.0.r1.g618cbaf
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/linuxmao-org/fogpad-port"
license=(MIT)
groups=(lv2-plugins)
depends=('git' 'pkgconf' 'cairo' 'jack' 'mesa')
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
source=(fogpad.lv2-git::git+https://github.com/linuxmao-org/fogpad-port)
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
  make
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir/" BUILD_VST2=false BUILD_JACK=false install
}
