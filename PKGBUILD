# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=wf-recorder
pkgver=0.2.1
pkgrel=1
license=(MIT)
pkgdesc="Screen recorder for wlroots-based compositors such as sway"
makedepends=("meson" "wayland-protocols" "ninja" "scdoc" "opencl-headers")
depends=("ffmpeg" "ocl-icd")
optdepends=(
	"slurp: limit recording to a part of the screen"
)
conflicts=('wf-recorder')
arch=("i686" "x86_64")
url='https://github.com/ammen99/wf-recorder'
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('bfe51f4f88ba755ac0ad993d00da706496f84e60b53de0ae24fe1c654cfaa376')

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
