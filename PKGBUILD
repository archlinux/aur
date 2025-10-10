# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Dominic Radermacher <dominic@familie-radermacher.ch>

pkgname=mhwaveedit
pkgver=1.4.24
pkgrel=3
pkgdesc="A simple and fast GTK2 audio editor"
arch=(aarch64 armv7h x86_64)
url='https://github.com/magnush/mhwaveedit'
license=(GPL-2.0-or-later)
depends=(glib2 glibc gtk2 hicolor-icon-theme pango sdl12-compat)
makedepends=(alsa-lib ladspa libpulse libsamplerate libsndfile jack)
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/magnush/mhwaveedit/archive/v$pkgver.tar.gz")
sha256sums=('a4115b3d18f3f038b08b2bf4ff599703b7ba69bc7ac510d5f7279b3f47ea57dd')

build() {
  cd $pkgname-$pkgver

  CFLAGS+=" -std=gnu17" \
  ./configure \
    --prefix=/usr \
    --with-double-samples \
    --without-arts \
    --without-esound \
    --without-oss
  make
}

package() {
  depends+=(libasound.so libgdk-x11-2.0.so libgtk-x11-2.0.so libglib-2.0.so libgobject-2.0.so
            libjack.so libpango-1.0.so  libpulse.so libsamplerate.so libsndfile.so)
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
