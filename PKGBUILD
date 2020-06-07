## To enable GTK support, uncomment the additional dependency and "--enable-gtk".
## Do the same with audacious-plugins-git. Then run Audacious by "audacious --gtk".

_pkgname=audacious-plugins
pkgname=$_pkgname-gtk
pkgver=4.0.4
pkgrel=1
pkgdesc="Plugins for Audacious"
arch=('x86_64')
url="https://audacious-media-player.org/"
license=('BSD' 'GPL')
provides=('audacious-plugins')
conflicts=('audacious-plugins')
depends=('audacious' 'glib2' 'alsa-lib' 'pulseaudio' 'jack2' 'lame' 'libvorbis' 'flac' 'mpg123' 'faad2' 'ffmpeg' 'libmodplug' 'fluidsynth' 'libcdio-paranoia' 'libsidplayfp' 'wavpack' 'dbus-glib' 'libsamplerate' 'libnotify' 'lirc' 'curl' 'libmtp' 'neon' 'libmms' 'libcue')
source=("https://distfiles.audacious-media-player.org/audacious-plugins-4.0.4.tar.bz2")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  autoreconf -I m4
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --enable-gtk \
    
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
 
