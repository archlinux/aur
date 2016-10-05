# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: satanselbow <igdfpm at gmail dot com>
# Contributor: Artem Sereda <overmind88 at gmail dot com>

pkgname="flacon"
pkgver=2.1.0
pkgrel=1
pkgdesc="Extracts individual tracks from one big audio file containing the \
 entire album of music and saves them as separate audio files."
arch=('i686' 'x86_64')
url="https://flacon.github.io/"
license=('LGPL2.1')
makedepends=('cmake' 'icu')
depends=('qt4' 'shntool' 'uchardet' 'ffmpeg')
optdepends=('flac: For FLAC support'
            'vorbis-tools: For OGG support'
            'mac: For APE support'
            'wavpack: For WavPack support'
            'ttaenc: For TrueAudio support'
            'lame: For MP3 support'
            'mp3gain: For MP3 Replay Gain support'
            'opus-tools: For OPUS support'   
            'vorbisgain: For OGG Replay Gain support')
conflicts=('flacon-git')
provides=("${pkgname}")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('787b84ba6f068bb54954ec4681f21aa815fe6f25f19f43f10942c5fcec967e2d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTS=Yes
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/tests"
    ./flacon_test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}


# vim:set ts=4 sw=2 ft=sh et:
