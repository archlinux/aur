# Contributor: Bitts311 <oceanmail311@gmail.com>

pkgname=audacious-plugins-gtk
_pkgname=audacious-plugins
pkgver=4.1.beta1
pkgrel=1
pkgdesc="Plugins for Audacious - latest stable release"
arch=('x86_64')
url="https://audacious-media-player.org/"
license=('BSD' 'GPL')
provides=('audacious-plugins')
conflicts=('audacious-plugins')
depends=('audacious' 'glib2' 'alsa-lib' 'pulseaudio' 'jack2' 'lame' 'libvorbis' 'flac' 'mpg123' 'faad2' 'ffmpeg' 'libmodplug' 'fluidsynth' 'libcdio-paranoia' 'libsidplayfp' 'wavpack' 'dbus-glib' 'libsamplerate' 'libnotify' 'lirc' 'curl' 'libmtp' 'neon' 'libmms' 'libcue')
source=("https://distfiles.audacious-media-player.org/audacious-plugins-4.1-beta1.tar.bz2")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname-4.1-beta1"
  autoreconf -I m4
}

build() {
  cd "$srcdir/$_pkgname-4.1-beta1"
if [ "$_use_meson" = 1 ]; then
    arch-meson build
    meson compile -C build
  else
    ./autogen.sh
    ./configure --prefix=/usr
    make
 fi
}

package() {
  cd "$srcdir/$_pkgname-4.1-beta1"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

