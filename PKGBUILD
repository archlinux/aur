# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=waypipe
pkgver=0.8.6
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications; like ssh -X'
license=('MIT')
# minimal build: only 'wayland' 'wayland-protocols' 'meson' 'ninja'
depends=('lz4' 'zstd' 'mesa' 'ffmpeg' 'libva')
optdepends=(
	'openssh: recommended transport'
	'systemtap: a makedepend, for tracing hooks'
)
makedepends=('git' 'meson' 'ninja' 'scdoc' 'libdrm' 'pkgconf' 'cmake')
checkdepends=('weston' 'python-psutil')
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
source=("https://gitlab.freedesktop.org/mstoeckl/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('156c1a7f042203113a6eb5634eec34d8507a5f5302492e5263d7a9acc9294eb0')
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
