# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=waypipe
pkgver=0.6.0
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications. WARNING: different versions are incompatible'
license=('MIT')
# minimal build: only 'wayland' 'wayland-protocols' 'meson' 'ninja'
depends=('lz4' 'zstd' 'mesa' 'ffmpeg' 'libva')
optdepends=(
	'openssh: recommended transport'
	'systemtap: a makedepend, for tracing hooks'
)
makedepends=('git' 'wayland' 'meson' 'ninja' 'scdoc' 'wayland-protocols' 'libdrm')
checkdepends=('weston' 'python-psutil')
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
source=("https://gitlab.freedesktop.org/mstoeckl/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('6264b1a0fc49b131d8710fb1a62ebc53ac23585071c50620f6c31e19066da952a5a9a55dccd0193521066fd11bede53f4c1c59790f58fb0300bda7ee1b5ec135')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')

build() {
	mkdir -p build
	arch-meson build $pkgname-v$pkgver -D werror=false -D b_ndebug=true
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
	install -Dm644 "$pkgname-v$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
