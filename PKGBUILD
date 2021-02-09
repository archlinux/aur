# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=audacious-plugins-libopenmpt
pkgver=4.1
pkgrel=1
pkgdesc='Plugins for Audacious (including libopenmpt)'
arch=(x86_64 i686)
url=https://audacious-media-player.org
license=(BSD GPL)
provides=("${pkgname%-libopenmpt}")
conflicts=("${pkgname%-libopenmpt}")
depends=(alsa-lib curl dbus-glib faad2 ffmpeg flac fluidsynth jack lame libbs2b libcdio-paranoia libcue libmms libmodplug libmtp libnotify libopenmpt libpulse libsamplerate libsidplayfp libvorbis lirc mpg123 neon wavpack)
makedepends=("audacious>=$pkgver" glib2 python)
source=(https://distfiles.audacious-media-player.org/${pkgname%-libopenmpt}-$pkgver.tar.bz2)
sha256sums=('dad6fc625055349d589e36e8e5c8ae7dfafcddfe96894806509696d82bb61d4c')

build() {
  cd "${pkgname%-libopenmpt}-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-gtk \
    --enable-amidiplug
  make
}

package() {
  cd "${pkgname%-libopenmpt}-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
