# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgname=audacious-plugins
pkgname=$_pkgname-gtk3
pkgver=4.1
pkgrel=2
pkgdesc="Plugins for Audacious"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD' 'GPL')
depends=('alsa-lib' 'curl' 'dbus-glib' 'faad2' 'ffmpeg' 'flac' 'fluidsynth'
         'jack' 'lame' 'libcdio-paranoia' 'libcue' 'libmms' 'libmodplug'
         'libmtp' 'libpulse' 'libnotify' 'libsamplerate' 'libsidplayfp'
         'libvorbis' 'lirc' 'mpg123' 'neon' 'wavpack' 'libbs2b' 'libopenmpt')
makedepends=("audacious-gtk3>=$pkgver" 'glib2' 'python' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
_commit=111a7c92c5771a8072901700515858e5500b66b0
source=("git+https://github.com/audacious-media-player/$_pkgname.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  autoreconf -I m4
}

build() {
  cd "$_pkgname"
  ./configure \
    --prefix=/usr \
    --disable-qt
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
