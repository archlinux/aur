# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Reiser <metal@pop3.ru>
# Contributor: Andrew Panchenko <panchenkoac at gmail>

pkgname=qmmp-svn
pkgver=1.1.1.svn.r6521
pkgrel=1
pkgdesc="A Qt based audio-player. (SVN Version)"
arch=('i686' 'x86_64')
url='http://qmmp.ylsoftware.com'
license=('GPL')
depends=('curl'
         'hicolor-icon-theme'
         'qt5-x11extras'
         'xdg-utils'
         'taglib'
         )
makedepends=('subversion'
             'cmake'
             'flac'
             'jack2'
             'libmpcdec'
             'libpulse'
             'ffmpeg'
             'libcdio-paranoia'
             'libcddb'
             'enca'
             'wildmidi'
             'libgme'
             'libmad'
             'libvorbis'
             'libogg'
             'libmms'
             'libsamplerate'
             'libmodplug'
             'libsndfile'
             'wavpack'
             'projectm'
             'mesa'
             'libsidplayfp'
             'opusfile'
             'faad2'
             'libbs2b'
             'taglib'
             'alsa-lib'
             'qt5-multimedia'
             )
optdepends=('qmmp-plugin-pack-svn: for mpg123, ffap and qtui plugin'
            'flac: native FLAC support'
            'jack2: JACK sound output'
            'libmpcdec: Musepack support'
            'alsa-lib: ALSA output suppport'
            'libpulse: PulseAudio output support'
            'libcdio-paranoia: Compact Disc input and control support'
            'libcddb: CDDB server support'
            'libmms: MMS stream protocol support'
            'libmodplug: MOD playing library support'
            'libsndfile: sampled sound support'
            'projectm: visual efects support'
            'ffmpeg: FFmpeg engine (include lot of audio formats) support'
            'mplayer: Mplayer engine (include lot of audio formats) support'
            'libsamplerate: audio filter support'
            'libbs2b: audio filter support'
            'wavpack: WavPack audio support'
            'libsidplayfp: SID audio support'
            'opusfile: OPUS audio support'
            'enca: CUEsheet audio and text encoding support'
            'wildmidi: native MIDI audio support'
            'faad2: native AAC audio support'
            'libgme: video game music format suppoort'
            'libmad: MPEG audio decoder support'
            'libvorbis: Vorbis audio support'
            'libogg: OGG audio support'
            'qt5-multimedia: Qt media output support'
            )
provides=('qmmp')
conflicts=('qmmp')
source=('qmmp::svn+svn://svn.code.sf.net/p/qmmp-dev/code/branches/qmmp-1.2')
sha1sums=('SKIP')

pkgver() {
  cd qmmp
  echo "$(cat qmmp.pri | grep QMMP_VERSION | cut -d ' ' -f3).svn.r$(svnversion)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../qmmp \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_DIR=lib
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
