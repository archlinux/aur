# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=waypipe
pkgver=0.6.1
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
sha512sums=('7b7cdc6d808f8f9e3720425af6ca1a75b81ffadc990e181f52940320efab6d5c6b55dcc10adb36c90b784426a71fab2a037206f4cb2634775628b52dc27cb830')
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
