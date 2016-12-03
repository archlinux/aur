# Maintainer: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=baresip
pkgver=0.4.20
pkgrel=1
pkgdesc="portable and modular SIP User-Agent with audio and video support"
arch=('i686' 'x86_64')
url="http://creytiv.com/baresip.html"
license=('BSD')
depends=('rem')
optdepends=('alsa-lib: (alsa module)'
            'cairo: (cairo, rst modules)'
            'ffmpeg: (avcodec, avformat, h265 modules)'
            'gsm: (gsm module)'
            'gst-plugins-bad: (gst1, gst_video1 modules)'
            'gst-plugins-base: (gst1, gst_video1 modules)'
            'gst-plugins-good: (gst1, gst_video1 modules)'
            'gst-plugins-ugly: (gst1, gst_video1 modules)'
            'gtk2: (gtk module)'
            'libsrtp: (libsrtp module)'
            'libsndfile: (sndfile module)'
            'libvpx: (vpx module)'
            'libx11: (x11, x11grab modules)'
            'mpg123: (rst module)'
            'opus: (opus module)'
            'sdl: (sdl module)'
            'sdl2: (sdl2 module)'
            'spandsp: (g722, g726,plc modules)'
            'speex: (speex module)'
            'speexdsp: (speex_aec, speex_pp modules)'
            'v4l-utils: (v4l2 module)')
makedepends=(${optdepends[@]/%:*/})
source=("http://creytiv.com/pub/$pkgname-$pkgver.tar.gz"
	"patch-alsa.diff"
	"patch-v4l2.diff")
md5sums=('b18f6560a7c4bc32ad56de1088989abf'
         'd6be41540262d1525548901d8374d972'
         '218c383c58167f353ae228673291d0f2')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < ${srcdir}/patch-alsa.diff
	patch -p1 < ${srcdir}/patch-v4l2.diff
}

build() {
	cd "$pkgname-$pkgver"
	make V=1 USE_GST= USE_GST_VIDEO= PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make USE_GST= USE_GST_VIDEO= PREFIX="/usr" \
		DESTDIR="$pkgdir/" install
}
