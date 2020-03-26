# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Reiser <metal@pop3.ru>
# Contributor: Andrew Panchenko <panchenkoac at gmail>

pkgname=qmmp-svn
pkgver=1.4.0.svn.r9311
pkgrel=1
pkgdesc="A Qt based audio-player. (SVN Version)"
arch=('x86_64')
url='http://qmmp.ylsoftware.com'
license=('GPL')
depends=('curl'
         'hicolor-icon-theme'
         'qt5-x11extras'
         'taglib'
         'desktop-file-utils'
         )
makedepends=('subversion'
             'cmake'
             'flac'
             'jack'
             'libmpcdec'
             'libpulse'
             'libavformat.so'
             'libavcodec.so'
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
             'libarchive'
             'libshout'
             'mpg123'
             )
optdepends=('qmmp-plugin-pack-svn: for mpg123, ffap and qtui plugin'
            'flac: native FLAC support'
            'jack: JACK sound output'
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
            'libarchive: libarchive input support'
            'libshout: shoutcast/icecast input support'
            'mpg123: alternative Mpeg-1-2-3 support'
            )
provides=('qmmp')
conflicts=('qmmp')
source=('qmmp::svn+http://svn.code.sf.net/p/qmmp-dev/code/trunk/qmmp/'
        'pkgconfig_fix.diff'
        )
sha256sums=('SKIP'
            'cdc27a35edd99635fdcc912c987479fd2fb4265b8ef55f908307afb5d6ae2978'
            )

pkgver() {
  cd qmmp
  echo "$(cat qmmp.pri | grep -m1 QMMP_VERSION | cut -d ' ' -f3).svn.r$(svnversion | tr -d M)"
}

prepare() {
  mkdir -p build

  patch -d qmmp -p0 -i "${srcdir}/pkgconfig_fix.diff"
}

build() {
  cd build
  cmake ../qmmp \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
