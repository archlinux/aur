# $Id$
# Maintainer: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=audacious-plugins-git
pkgver=2015.10.10
pkgrel=1
pkgdesc="Plugins for Audacious"
arch=('i686' 'x86_64')
url="http://audacious-media-player.org/"
license=('BSD' 'GPL')
provides=('audacious-plugins')
conflicts=('audacious-plugins')

makedepends=("audacious-git>=$pkgver"
             'glib2' 'python2' # for gdbus-codegen
             'alsa-lib' 'pulseaudio' 'jack2' 'lame' 'libvorbis' 'flac' 'mpg123'
             'faad2' 'ffmpeg' 'libmodplug' 'fluidsynth' 'libcdio-paranoia'
             'libsidplayfp' 'wavpack' 'dbus-glib' 'libnotify' 'lirc' 'curl'
             'libmtp' 'neon' 'libmms' 'libcue' 'git') # 'libbs2b')

optdepends=('alsa-lib: Advanced Linux Sound Arch. output'
            'pulseaudio: PulseAudio output'
            'jack2: Jack Audio Connection Kit output'
            'lame: FileWriter MP3 output'
            'libvorbis: Vorbis input, FileWriter Vorbis output'
            'flac: FLAC input, FileWriter FLAC output'

            'mpg123: MP3 input'
            'faad2: AAC input'
            'ffmpeg: ffaudio input'
            'libmodplug: modplug input'
            'fluidsynth: MIDI FluidSynth backend input'
            'libcdio-paranoia: CD Digital Audio input'
            'libsidplayfp: Commodore 64 audio input'
            'wavpack: WavPack input'

            'dbus-glib: Gnome Shortcuts Plugin'
            'libnotify: libnotify OSD'
            'lirc: LIRC'
            'curl: AudioScrobbler Client'
            'libmtp: Upload to MTP device'
          # 'libbs2b: Bauer stereophonic-to-binaural DSP'

            'neon: neon-based http transport'
            'libmms: libmms-based mms transport'
            'libcue: CUE playlist format')

source=('git://github.com/audacious-media-player/audacious-plugins.git') # #branch=gtk3')
sha256sums=('SKIP')

pkgver() {
  date +%Y.%m.%d
}

build() {
  cd "$srcdir/audacious-plugins"

  autoreconf -I m4
  ./configure \
    --prefix=/usr \
  # --enable-qt \

  make
}

package() {
  cd "$srcdir/audacious-plugins"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/audacious-plugins/LICENSE"
}
