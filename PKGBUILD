# Maintainer: Jakub Skowron <jakubskowron766@proton.me>
pkgname=scolorpicker-legacy
pkgver=1.2.1
pkgrel=4
pkgdesc="Legacy (C + X11-only) version of skowriii's color picker"
arch=("x86_64")
url="https://github.com/skowriii/scolorpicker/tree/scp"
license=("0BSD")
depends=("libx11" "xsel" "libxext")
makedepends=("cmake")
conflicts=("scolorpicker")
options=(!debug)
source=("$pkgname-$pkgver.tar.gz")
md5sums=("SKIP")

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE="None" \
		-DINSTALL_SYSTEM_WIDE=YES
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname-$pkgver/LICENSE
}
