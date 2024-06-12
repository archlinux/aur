# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgname=audacious-plugins
pkgname=$_pkgname-gtk3
pkgver=4.4
pkgrel=1
pkgdesc="Plugins for Audacious"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD' 'GPL')
depends=("audacious-gtk3>=$pkgver"
         'alsa-lib' 'curl' 'dbus-glib' 'faad2' 'ffmpeg' 'flac' 'fluidsynth'
         'jack' 'json-glib' 'lame' 'libbs2b' 'libcddb' 'libcdio-paranoia'
         'libcue' 'libmms' 'libmodplug' 'libmtp' 'libnotify' 'libopenmpt'
         'libpipewire' 'libpulse' 'libsamplerate' 'libsidplayfp' 'libvorbis'
         'lirc' 'mpg123' 'neon' 'opusfile' 'wavpack')
makedepends=('meson' 'python-packaging')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://distfiles.audacious-media-player.org/$_pkgname-$pkgver.tar.bz2")
sha256sums=('3caf3a5fe5b6f2808f461f85132fbff4ae22a53ef9f3d26d9e6030f6c6d5baa2')

build() {
  arch-meson $_pkgname-$pkgver build \
    -Dqt=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $_pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
