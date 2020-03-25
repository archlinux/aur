# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=audacious-plugins
pkgname=${_pkgname}-qt5
epoch=1
pkgver=4.0
pkgrel=1
pkgdesc="Plugins for Audacious (qt5 interface)"
arch=('i686' 'x86_64')
url="http://audacious-media-player.org/"
license=('BSD' 'GPL')

makedepends=("audacious-qt5>=$pkgver" 'qt5-multimedia'
             'glib2' 'python' # for gdbus-codegen
             'alsa-lib' 'pulseaudio' 'jack2' 'lame' 'libvorbis' 'flac'
             'mpg123' 'faad2' 'ffmpeg' 'libmodplug' 'fluidsynth' 'libcdio-paranoia' 'libsidplayfp' 'wavpack'
             'dbus-glib' 'libnotify' 'lirc' 'curl' 'libmtp'
             'neon' 'libmms' 'libcue') #libbs2b sndio ampache sdl2

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
            'neon: neon-based http transport'
            'libmms: libmms-based mms transport'
            'libcue: CUE playlist format'
            'qt5-multimedia: qtaudio support')

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(https://distfiles.audacious-media-player.org/$_pkgname-${pkgver/+/-}.tar.bz2)
sha256sums=('e1ad3223c7833f167642563f3c30c68d292b1a457c9f0159fdedd58e575e3ee4')

build() {
  cd "$srcdir/$_pkgname-${pkgver/+/-}"

  ./configure \
    --prefix=/usr \
    --enable-amidiplug
  make
}

package() {
  cd "$srcdir/$_pkgname-${pkgver/+/-}"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
