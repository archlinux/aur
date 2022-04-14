# Maintainer: Gustavo Heinz <gustavo at gsthnz dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Dmitrij D. Czarkoff <czarkoff at gmail dot com>

pkgname=baresip
pkgver=2.0.2
pkgrel=1
pkgdesc="portable and modular SIP User-Agent with audio and video support"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/baresip/baresip"
license=('BSD')
depends=('rem'
         'openssl'
         're')
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
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/baresip/baresip/archive/v${pkgver}.tar.gz")
sha256sums=("f1c48c336ca7300971619358f532367c7dabfc6e16b2b2bfc99646ed50271d93")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make V=1 USE_GST= USE_GST_VIDEO= DESTDIR="/usr" PREFIX="/usr"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make USE_GST= USE_GST_VIDEO= PREFIX="/usr" \
    DESTDIR="$pkgdir/" install
  install -Dm644 docs/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
