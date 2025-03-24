# Contributor Hanabishi
# Maintainer TheCyberArcher@protonmail.ch

_name=qmmp
pkgname=${_name}-1
pkgver=2.2.3
pkgrel=1
pkgdesc="Qt based audio-player (1.x branch)"
arch=('x86_64')
url="https://qmmp.ylsoftware.com"
license=('GPL-2.0-or-later' 'CC-BY-NC-SA-4.0')
provides=("${_name}=${pkgver}")

depends=(
    'alsa-lib' 'curl' 'desktop-file-utils' 'hicolor-icon-theme' 'libmad' 'libvorbis'
    'libogg' 'libxkbcommon-x11' 'taglib' 'xdg-utils' 'qt6-base'
)
makedepends=(
    'cmake' 'flac' 'jack' 'libmpcdec' 'pipewire' 'pulseaudio' 'ffmpeg' 'libcdio-paranoia'
    'libcddb' 'libmms' 'libsamplerate' 'libmodplug' 'libsndfile' 'wavpack' 'mpg123' 'mesa'
    'projectm' 'faad2' 'libgme' 'libsidplayfp' 'opusfile>=0.12' 'wildmidi' 'qt6-tools'
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
source=("${url}/files/${_name}/${pkgver%.*}/${_snapshot}.tar.bz2")
sha256sums=('993e57d8e11b083bb6f246738505edf35d498ffe82a1936f3129b8bb09eab244')

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
