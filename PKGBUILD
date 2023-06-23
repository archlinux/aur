
# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
# Contributor: Asuka Minato
pkgname=ggmorse-git
pkgver=r58.55b4aad
pkgrel=1
pkgdesc="Morse code decoding library"
arch=(any)
url="https://github.com/ggerganov/ggmorse"
license=('MIT')
depends=(sdl2)
makedepends=(git cmake)
provides=(ggmorse-from-file  ggmorse-gui  ggmorse-to-file)
source=("git+https://github.com/ggerganov/ggmorse")
sha256sums=('SKIP')

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
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
