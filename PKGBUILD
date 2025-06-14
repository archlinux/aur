# Maintainer: Young Acinonyx <young [dot] acinonyx [at] gmail [dot] com>

pkgname=libvpx1.7
pkgver=1.7.0
pkgrel=1
pkgdesc="Legacy VP8/VP9 codec library (provides libvpx.so.5)"
arch=('x86_64')
url="https://www.webmproject.org/"
license=(custom:BSD)
depends=('glibc' 'gcc-libs')
makedepends=('yasm')
source=("https://github.com/webmproject/libvpx/archive/v${pkgver}.tar.gz")
sha256sums=('1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238')
provides=('libvpx.so')
 
build() {
	cd "$srcdir/libvpx-${pkgver}"
	./configure \
		--prefix=/usr \
		--disable-install-docs \
		--disable-install-srcs \
		--disable-unit-tests \
		--enable-pic \
		--enable-runtime-cpu-detect \
		--enable-shared \
		--enable-vp8 \
		--enable-vp9
	make
}
 
package() {
	cd "$srcdir/libvpx-${pkgver}"
	make DESTDIR="$pkgdir" install

	# Remove unneeded files so that only the shared library remains
	rm -rf "$pkgdir/usr"/{bin,include,lib/{libvpx.{a,so},pkgconfig},share}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/libvpx5/LICENSE"
}
