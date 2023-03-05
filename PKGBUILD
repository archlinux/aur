# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgname=audacious-plugins
pkgname=$_pkgname-gtk3
pkgver=4.3
pkgrel=1
pkgdesc="Plugins for Audacious"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD' 'GPL')
depends=("audacious-gtk3>=$pkgver"
         'alsa-lib' 'curl' 'dbus-glib' 'faad2' 'ffmpeg' 'flac' 'fluidsynth'
         'jack' 'lame' 'libbs2b' 'libcddb' 'libcdio-paranoia' 'libcue' 'libmms'
         'libmodplug' 'libmtp' 'libnotify' 'libopenmpt' 'libpipewire' 'libpulse'
         'libsamplerate' 'libsidplayfp' 'libvorbis' 'lirc' 'mpg123' 'neon'
         'opusfile' 'wavpack')
makedepends=('glib2' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://distfiles.audacious-media-player.org/$_pkgname-$pkgver.tar.bz2")
sha256sums=('662ef6c8c4bd70d0f35fd1c5f08b91549b9436638b65f8a1a33956b09df89fc6')

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --enable-gtk3 \
    --disable-qt
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
