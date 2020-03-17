# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=wf-recorder
pkgver=0.2
pkgrel=1
license=(MIT)
pkgdesc="Screen recorder for wlroots-based compositors such as sway"
makedepends=("meson" "wayland-protocols" "ninja" "scdoc")
depends=("ffmpeg" "ocl-icd")
optdepends=(
	"slurp: limit recording to a part of the screen"
)
arch=("i686" "x86_64")
url='https://github.com/ammen99/wf-recorder'
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('0d306171a564ed955ff7a48a763ab6f3023f7f1f81f9a8012c46f46075b19b3d')

prepare() {
	cd "$pkgname-$pkgver"
	meson -Dwerror=false --prefix /usr "$srcdir/build" --buildtype=release
}

build() {
	cd "$pkgname-$pkgver"
	ninja -C "$srcdir/build"
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
