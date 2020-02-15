# Maintainer: Andre Vallestero < gmail-com: andrevallestero >

pkgname=libva-v4l2-request-hantro-h264-git
_srcname=libva-v4l2-request
pkgver=r240.406420a
pkgrel=2
pkgdesc='LibVA implementation for the Linux Video4Linux2 Request API (Hantro 264 support, git version)'
arch=('aarch64')
url="https://github.com/pH5/libva-v4l2-request"
license=('LGPL2.1' 'MIT')
depends=('libva' 'libdrm>=2.4.52')
makedepends=('meson' 'git')
provides=('v4l2_request_drv_video.so')
conflicts=('libva-v4l2-request')
source=('git+https://github.com/pH5/libva-v4l2-request.git#branch=hantro-h264')
sha256sums=('SKIP')

pkgver() {
	cd "$_srcname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_srcname"
	meson --prefix /usr --buildtype=release build
	ninja -C build
}

package() {
	cd "$srcdir/$_srcname"
	DESTDIR="$pkgdir" ninja -C build install
	mkdir -p "$pkgdir/usr/share/licenses/$_srcname"
	install -D -m644 COPYING* "$pkgdir/usr/share/licenses/$_srcname/"
}
