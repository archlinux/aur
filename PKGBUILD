# Maintainer: Atharv Gokule <gokuleatharv06@gmail.com>
pkgname='timepad'
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal Timer App for Linux that has a picture-in-picture mode"
arch=('x86_64')
url="https://github.com/agokule/timepad"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'sdl3')
makedepends=('git' 'cmake' 'base-devel')
options=('!debug')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
install=
source=(
	'timepad::git+https://github.com/agokule/timepad.git#commit=62377d67d63975d6e64b975f19af7f6c16fdcc67'
)
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/${pkgname}"
}

build() {
	cd "$srcdir/${pkgname}"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DDISTRIBUTION_MODE=ON
	cmake --build build -- -j
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm755 ./build/Timepad "$pkgdir/usr/bin/Timepad"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/timepad/LICENSE"

	install -Dm644 ./assets/fonts/Font\ Awesome\ 7\ Free-Regular-400.otf -t "$pkgdir/usr/share/timepad/fonts/"
	install -Dm644 ./assets/fonts/Font\ Awesome\ 7\ Free-Solid-900.otf   -t "$pkgdir/usr/share/timepad/fonts/"
	install -Dm644 ./assets/fonts/MaterialSymbolsRounded-Regular.ttf     -t "$pkgdir/usr/share/timepad/fonts/"
	install -Dm644 ./assets/fonts/Roboto-Regular.ttf                     -t "$pkgdir/usr/share/timepad/fonts/"

	install -Dm644 ./assets/sound/freesound_community-kitchen-timer-87485.mp3 -t "$pkgdir/usr/share/timepad/sound/"

	install -Dm644 ./assets/icon.png -t "$pkgdir/usr/share/timepad/"

	install -Dm644 ./Timepad.desktop "$pkgdir/usr/share/applications/timepad.desktop"
}
