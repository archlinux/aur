# Maintainer: Lisa Riedler <lmmsqt6git.aurpackages@riedler.wien>

_name=lmms
pkgname=lmms-qt6-git
pkgver=1.3.0.alpha.1.r896.g51529cefb
pkgrel=1
pkgdesc='The Linux MultiMedia Studio, Qt6 version.'
arch=('x86_64')
url="https://lmms.io"
license=('GPL-2.0-only')
depends=('fftw' 'fltk' 'fluidsynth' 'lame' 'libgig' 'sdl2' 'stk' 'libsamplerate' 'qt6-svg' 'sndio')
optdepends=('pulse-native-provider: playing audio via pulseaudio'
            'jack: playing audio via jack'
            'alsa-lib: playing audio via alsa'
            'portaudio: playing audio via portaudio'
            'libsoundio: playing audio via soundio'
            'wine: VST plugin support (64bit only)'
            'wine32: VST plugin support (32bit+64bit)'
            'carla: carla support'
            'perl-xml-parser: swh LADSPA plugin support'
            'lilv: lv2 support'
            'libvorbis: exporting ogg vorbis'
            'libogg: exporting ogg vorbis')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'freetype2' 'git'
'ladspa' 'qt6-tools' 'wine' 'perl-list-moreutils' 'perl-xml-parser'
'libsndfile')
provides=('lmms')
conflicts=('lmms')
source=("git+https://github.com/${_name}/${_name}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_name}"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "${_name}"
	mkdir -vp build
	git submodule init
	git submodule update
}

build() {
	cd "${_name}/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DWANT_QT6=ON -DCMAKE_BUILD_TYPE=Release ..
	cmake --build .
}

package() {
	cd "${_name}/build"
	make DESTDIR="$pkgdir" install
}
