# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=aqualung
pkgver=1.1
pkgrel=1
pkgdesc="High quality music player w/ gapless support"
arch=(i686 x86_64)
url="http://aqualung.jeremyevans.net/"
license=(GPL)
depends=(gtk2 libxml2 alsa-lib sndio jack libpulse liboggz libusb-compat
         libifp ffmpeg libvorbis libsndfile lua52 wavpack libcdio-paranoia
         libmad flac liblrdf libmpcdec libsamplerate)
makedepends=(ladspa libcddb speex lame libmodplug)
optdepends=('libcddb: CDDB / FreeDB support'
            'speex: Oggz speex support (playback)'
            'lame: MP3 audio support (encode)'
            'libmodplug: MOD files support (playback .mod .s3m .xm .it ...)')
source=("https://github.com/jeremyevans/aqualung/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "aqualung-Fix_arr_strlcpy_call_in_ifp_device.diff::https://github.com/jeremyevans/aqualung/commit/2a3732f1575d69b64ed5c9b76c6213c7d4fbc20b.diff"
        aqualung.desktop)
sha256sums=('751c0dfa76840227b8be5d099859990bc765180ba5cd556c6c72f81b368afcbc'
            '4bb65f0be123934e3710b226760d2aac0cdf1e85b73cd3a4004aaed11cf7a504'
            '4d2aba2924b7c0bacbd377a6975f1cdbf09dc67a5d61c36bf2d52bddbab1b3b9')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../aqualung-Fix_arr_strlcpy_call_in_ifp_device.diff
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "src/img/icon_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/aqualung.desktop" "${pkgdir}/usr/share/applications/aqualung.desktop"
}
