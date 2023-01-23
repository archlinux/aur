# Maintainer: Joe Davison <joe@davison.tech>

pkgname=openenroth-git
pkgver=r1740.67f04ebd2
pkgrel=1
pkgdesc="Open source engine reimplementation of Might & Magic 6, 7, and 8"
arch=('x86_64')
url="https://github.com/OpenEnroth/OpenEnroth"
license=('LGPL-3.0')
depends=('sdl2' 'openal' 'zlib' 'ffmpeg')
makedepends=('git' 'cmake' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/OpenEnroth/OpenEnroth.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/OpenEnroth"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/OpenEnroth"
	cmake -B build -S . \
                -DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build build
}

package() {

# Right now, the cmake installer for OE is broken and so installing with cmake --install doesn't work.
# We'll manually move the executable for now
#	DESTDIR="$pkgdir" cmake --install build

	install -D -m 755 "$srcdir/OpenEnroth/build/OpenEnroth" \
		"$pkgdir/usr/bin/OpenEnroth"
}
