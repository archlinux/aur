# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=aqualung
pkgver=1.1+4+g44a3f40
pkgrel=1
pkgdesc="High quality music player w/ gapless support"
arch=(i686 x86_64)
url="https://aqualung.jeremyevans.net/"
license=(GPL)
depends=(gtk2 libxml2 alsa-lib sndio jack libpulse liboggz libusb-compat
         libifp ffmpeg4.4 libvorbis libsndfile lua52 wavpack libcdio-paranoia
         libmad flac liblrdf libmpcdec libsamplerate)
makedepends=(git ladspa libcddb speex lame libmodplug)
optdepends=('libcddb: CDDB / FreeDB support'
            'speex: Oggz speex support (playback)'
            'lame: MP3 audio support (encode)'
            'libmodplug: MOD files support (playback .mod .s3m .xm .it ...)')
_commit=44a3f40d784010a183e1f61cbd02615ff5568358
source=("git+https://github.com/jeremyevans/aqualung.git#commit=${_commit}"
        aqualung.desktop)
sha256sums=('SKIP'
            '4d2aba2924b7c0bacbd377a6975f1cdbf09dc67a5d61c36bf2d52bddbab1b3b9')

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

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
  install -Dm644 "src/img/icon_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/aqualung.desktop" "${pkgdir}/usr/share/applications/aqualung.desktop"
}
