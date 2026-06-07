# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgname=audacious-plugins
pkgname=$_pkgname-gtk3
pkgver=4.6.1
pkgrel=1
pkgdesc="Plugins for Audacious"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD' 'GPL')
depends=("audacious-gtk3>=$pkgver"
         'alsa-lib' 'curl' 'faad2' 'ffmpeg' 'flac' 'fluidsynth'
         'jack' 'json-glib' 'lame' 'libbs2b' 'libcddb' 'libcdio-paranoia'
         'libcue' 'libmms' 'libmodplug' 'libmtp' 'libnotify' 'libopenmpt'
         'libpipewire' 'libpulse' 'libsamplerate' 'libsidplayfp' 'libvorbis'
         'lirc' 'mpg123' 'neon' 'opusfile' 'wavpack')
makedepends=('meson' 'glib2-devel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://distfiles.audacious-media-player.org/$_pkgname-$pkgver.tar.bz2"
        "sidplay-rom-paths.patch")
sha256sums=('22e58a8a2c3f3caa9687434353618c822963cc8846cd239de36d4e8e5bd166a6'
            '5740193b5fc5844a8144bdfbba32f67eee5701bc0e4dc94cea00b6680516322e')

prepare() {
  cd $_pkgname-$pkgver

  # set paths for ROM files from vice for sidplay
  patch -Np1 -i ../sidplay-rom-paths.patch
}

build() {
  arch-meson $_pkgname-$pkgver build \
    -Dqt=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $_pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
