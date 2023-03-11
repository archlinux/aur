# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=ggmorse-git
pkgver=r58.55b4aad
pkgrel=1
epoch=
pkgdesc="Morse code decoding library"
arch=(any)
url="https://github.com/ggerganov/ggmorse"
license=('MIT')
groups=()
depends=(sdl2)
makedepends=(git cmake)
checkdepends=()
optdepends=()
provides=(ggmorse-from-file  ggmorse-gui  ggmorse-to-file)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/ggerganov/ggmorse")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "ggmorse"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	pushd "ggmorse"
	git submodule init
	git submodule update
}

build() {
	pushd "ggmorse"
	mkdir build && pushd build
	cmake ..
	make
}

package() {
	pushd "ggmorse"
	install -Dm755 ./build/bin/ggmorse* -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/
}
