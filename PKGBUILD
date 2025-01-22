# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
# Contributor: VitalyR <vr AT vitalyr DOT com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl3
pkgver=3.2.0
epoch=1
pkgrel=1
pkgdesc="Simple Directmedia Layer (Version 3)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.libsdl.org"
license=('Zlib')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'hidapi' 'libusb')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'fcitx5' 'libxss' 'cmake' 'jack' 'ninja' 'pipewire'
	     'libdecor' 'git' 'sndio')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver'
	    'pipewire: PipeWire audio driver'
	    'sndio: MIDI audio driver'
	    'libdecor: Wayland client decorations')
source=("https://github.com/libsdl-org/SDL/archive/refs/tags/release-${pkgver}.tar.gz")
sha256sums=('a8a614624531883e9288960d52713d228374c5d5b00228e410ce351bb32842c0')

build() {
	cd "$srcdir"
	CFLAGS+=" -ffat-lto-objects"
	cmake -S SDL-release-${pkgver} \
	-B build -G Ninja \
	-D CMAKE_BUILD_TYPE=None \
	-D SDL_HIDAPI_LIBUSB=ON \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF \
	-D SDL_TEST_LIBRARY=OFF
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="${pkgdir}" cmake --install build
	mv "${pkgdir}/usr/share/licenses/SDL3" "${pkgdir}/usr/share/licenses/sdl3"
}

