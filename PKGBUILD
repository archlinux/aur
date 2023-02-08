_name=qmmp
pkgname=${_name}-1
pkgver=1.6.2
pkgrel=2
pkgdesc="Qt based audio-player (1.x branch)"
arch=('x86_64')
url="https://qmmp.ylsoftware.com"
license=('GPL')
provides=("${_name}=${pkgver}")

depends=(
    'alsa-lib' 'curl' 'desktop-file-utils' 'hicolor-icon-theme' 'libmad' 'libvorbis'
    'libogg' 'libxkbcommon-x11' 'taglib' 'xdg-utils' 'qt5-base'
)
makedepends=(
    'cmake' 'flac' 'jack' 'libmpcdec' 'pipewire' 'pulseaudio' 'ffmpeg' 'libcdio-paranoia'
    'libcddb' 'libmms' 'libsamplerate' 'libmodplug' 'libsndfile' 'wavpack' 'mpg123' 'mesa'
    'projectm' 'faad2' 'libgme' 'libsidplayfp' 'opusfile>=0.12' 'wildmidi' 'qt5-tools'
)
optdepends=(
    'mpg123: to play MP3 files'
    'flac: native FLAC support'
    'jack: JACK sound output'
    'libmpcdec: Musepack support'
    'pulseaudio: PulseAudio output'
    'pipewire: pipewire support'
    'libcdio-paranoia: Compact Disc input and control support'
    'libcddb: CDDB server support'
    'libmms: MMS stream protocol support'
    'libmodplug: MOD playing library'
    'libsndfile: sampled sound support'
    'projectm: visual efects'
    'faad2: ADTS AAC support'
    'libgme: support for chiptunes from various platforms'
    'libsidplayfp: C64 music support'
    'opusfile: Opus support'
    'wildmidi: MIDI support'
    'ffmpeg' 'libsamplerate' 'wavpack'
)

_snapshot="${_name}-${pkgver}"
source=("${_snapshot}.tar.bz2::${url}/files/${_name}/${pkgver%.*}/${_snapshot}.tar.bz2")
sha256sums=('484b1318d01a0ac5c765605872074fec6bec32dde5d92cea2286d1d6760a30b5')

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DUSE_HAL:BOOL=FALSE

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
