# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>

pkgname=baresip
pkgver=0.6.3
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
sha256sums=('c8005466b4947e28bc48ceb3d99608c782109970c2653b9d0eb0900d4695300c'
            '55af521d77e105bb519f60464b2e50b83da15eb8549c18dabefa15215b22fa92')

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
