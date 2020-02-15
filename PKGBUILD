# Maintainer: Andre Vallestero < gmail-com: andrevallestero >

pkgname=libva-hantro-h264-git
_srcname=libva
pkgver=r1580.0b8a288
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux (Hantro H264 support, git version)'
arch=('aarch64')
url='https://github.com/pH5/libva/tree/hantro-h264'
license=('MIT')
depends=('libdrm' 'libgl' 'libx11' 'libxext' 'libxfixes' 'wayland')
makedepends=('git' 'libglvnd' 'mesa' 'meson')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards')
provides=('libva' 'libva-drm.so' 'libva-glx.so' 'libva-wayland.so'
          'libva-x11.so' 'libva.so')
conflicts=('libva')
source=('git+https://github.com/pH5/libva.git#branch=hantro-h264')
sha256sums=('SKIP')

pkgver() {
	cd "$_srcname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_srcname"
	arch-meson . build
	ninja -C build
}

package() {
	cd "$_srcname"
	DESTDIR="$pkgdir" ninja -C build install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
