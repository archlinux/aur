# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>

pkgname=baresip
pkgver=0.6.4
pkgrel=1
pkgdesc="portable and modular SIP User-Agent with audio and video support"
arch=('i686' 'x86_64' 'armv6h')
url="http://www.creytiv.com/baresip.html"
license=('BSD')
depends=('rem'
         'openssl')
optdepends=('alsa-lib: (alsa module)'
            'cairo: (cairo, rst modules)'
            'ffmpeg: (avcodec, avformat, h265 modules)'
            'gsm: (gsm module)'
            'gst-plugins-bad: (gst1, gst_video1 modules)'
            'gst-plugins-base: (gst1, gst_video1 modules)'
            'gst-plugins-good: (gst1, gst_video1 modules)'
            'gst-plugins-ugly: (gst1, gst_video1 modules)'
            'gtk2: (gtk module)'
            'libsndfile: (sndfile module)'
            'libvpx: (vpx module)'
            'libx11: (x11, x11grab modules)'
            'mpg123: (rst module)'
            'opus: (opus module)'
            'sdl2: (sdl2 module)'
            'spandsp: (g722, g726,plc modules)'
            'speexdsp: (speex_aec, speex_pp modules)'
            'v4l-utils: (v4l2 module)')
makedepends=(${optdepends[@]/%:*/})
source=("http://creytiv.com/pub/$pkgname-$pkgver.tar.gz"
        "baresip-flags.patch")
sha256sums=('61710bd1bec406ae1faf167c5743bad8eef9ced5152a3943b94d7e1cf9597581'
            '87562245c11d6599fc7821803ab313181106399102e00fb9ed79db693cbef18f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/baresip-flags.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make V=1 USE_GST= USE_GST_VIDEO= PREFIX="/usr"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make USE_GST= USE_GST_VIDEO= PREFIX="/usr" \
    DESTDIR="$pkgdir/" install
  install -Dm644 docs/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
