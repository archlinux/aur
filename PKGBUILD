# Maintainer: Phantasm <phantasm@centrum.cz>
# Based on the official Arch Linux PKGBUILD

pkgname=soundkonverter-dark-theme-git
pkgver=3.0.1.32.gdd52d33
pkgrel=1
pkgdesc="Front-end to various audio converters (Git - with custom colors for dark themes)"
arch=(x86_64)
url="https://store.kde.org/p/1126634"
license=(GPL)
depends=(hicolor-icon-theme cdparanoia kdelibs4support libkcddb5 kdbusaddons5 taglib phonon-qt5)
makedepends=(extra-cmake-modules kdesignerplugin kdoctools5 kinit git)
optdepends=('faac: faac backend'
            'faad2: faad backend'
            'ffmpeg: ffmpeg backend'
            'flac: flac backend'
            'fluidsynth: flouidsynth backend'
            'lame: lame backend'
            'mac: mac backend'
            'mplayer: mplayer backend'
            'opus-tools: opus backend'
            'speex: speexenc, speexdec backends'
            'timidity++: midi backend'
            'twolame: twolame backend'
            'vorbisgain: vorbisgain backend'
            'vorbis-tools: vorbis tools backend'
            'wavpack: wavpack backend'
            'sox: sox plugin (change sample rate, various effects)')
source=("git+https://github.com/nphantasm/soundkonverter.git")
provides=(soundkonverter)
conflicts=(soundkonverter)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir"/soundkonverter
	echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
	cmake -S soundkonverter/src -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
