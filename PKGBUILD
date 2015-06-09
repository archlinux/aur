# $Id$
# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgname=audacious-plugins
pkgname=$_pkgname-gtk3
pkgver=3.6.2
_pkgver=$pkgver-gtk3
pkgrel=1
pkgdesc="Plugins for Audacious"
arch=('i686' 'x86_64')
url="http://audacious-media-player.org/"
license=('BSD' 'GPL')
provides=('audacious-plugins')
conflicts=('audacious-plugins')

makedepends=("audacious-gtk3>=$pkgver"
             'glib2' 'python2' # for gdbus-codegen
             'alsa-lib' 'pulseaudio' 'jack2' 'lame' 'libvorbis' 'flac'
             'mpg123' 'faad2' 'ffmpeg' 'libmodplug' 'fluidsynth'
             'libcdio-paranoia' 'libsidplayfp' 'wavpack' 'dbus-glib' 'libnotify'
             'lirc' 'curl' 'libmtp' 'neon' 'libmms' 'libcue')

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
            'libcue: CUE playlist format')

source=(http://distfiles.audacious-media-player.org/$_pkgname-$_pkgver.tar.bz2)
sha1sums=('5aec692e35e9dfd72f4c9f09e7bb24b3d94305bf')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

  ./configure \
    --prefix=/usr \
  # --enable-statusicon
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
