# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=xlibre-input-libinput
_pkgname=xf86-input-libinput
pkgver=25.0.1
pkgrel=4
pkgdesc="Generic input driver for the XLibre Xserver based on libinput"
arch=('x86_64')
license=('MIT')
url='https://github.com/X11Libre/xf86-input-libinput'
depends=(
	'glibc'
	'libinput'
	'xlibre-xserver'
)
makedepends=(
	'libx11'
	'libxi'
	'meson'
	'X-ABI-XINPUT_VERSION=26.0'
	'xlibre-xserver-devel'
)
provides=('xf86-input-libinput')
conflicts=(
	'X-ABI-XINPUT_VERSION<26'
	'X-ABI-XINPUT_VERSION>=27'
	'xf86-input-libinput'
)
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e11920ace1780981ee4f7c54f7da2a1fcaa78dde37e880f664fb8d8b610ce7b79003f8c5409579a82c751cceb0aeefa084344e3c5c9f53c2cbf6df87886200ef')

build() {
	arch-meson ${_pkgname}-xlibre-${_pkgname}-${pkgver} build \
	-D xorg-conf-dir=/usr/share/X11/xorg.conf.d/

	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
