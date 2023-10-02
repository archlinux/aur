# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=aqualung
pkgver=1.2
pkgrel=2
pkgdesc="High quality music player w/ gapless support"
arch=(i686 x86_64)
url="https://aqualung.jeremyevans.net/"
license=(GPL2)
depends=(gtk2 libxml2 alsa-lib sndio jack libpulse liboggz libusb-compat
         libifp ffmpeg libvorbis libsndfile lua52 wavpack libcdio-paranoia
         libmad flac liblrdf libmpcdec libsamplerate libcddb speex lame libmodplug # mac

         # namcap implicit depends
         glibc glib2 bzip2 zlib libogg gdk-pixbuf2 cairo pango libcdio hicolor-icon-theme)
makedepends=(git)
source=("git+https://github.com/jeremyevans/aqualung.git#tag=${pkgver}"
        aqualung.desktop)
sha256sums=('SKIP'
            '4d2aba2924b7c0bacbd377a6975f1cdbf09dc67a5d61c36bf2d52bddbab1b3b9')

prepare() {
  cd "${pkgname}"
  ./autogen.sh
}

build() {
  cd "${pkgname}"
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd "${pkgname}"
  make -k check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "src/img/icon_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/aqualung.png"
  install -Dm644 "src/img/icon_24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/aqualung.png"
  install -Dm644 "src/img/icon_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/aqualung.png"
  install -Dm644 "src/img/icon_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/aqualung.png"
  install -Dm644 "src/img/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/aqualung.png"
  install -Dm644 "${srcdir}/aqualung.desktop" "${pkgdir}/usr/share/applications/aqualung.desktop"
}
