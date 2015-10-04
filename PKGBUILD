# Maintainer: maz-1 < loveayawaka at gmail dot com> 

pkgname=gst-plugin-libde265
pkgver=0.1.12
pkgrel=1
pkgdesc="Libde265 plugin (an open h.265 video codec implementation) for gstreamer 1.x."
arch=('i686' 'x86_64')
url="https://github.com/strukturag/gstreamer-libde265"
license=('LGPL3')
depends=("libde265" "gstreamer" "gst-plugins-bad" "gst-plugins-base" "gst-plugins-good" "zlib" "bzip2")
source=( "https://codeload.github.com/strukturag/gstreamer-libde265/zip/v${pkgver}"
		"git://anongit.freedesktop.org/gstreamer/common")
md5sums=('50f36623b664d4993ae25dc4c652db80'
		'SKIP')



build() {
  cd gstreamer-libde265-${pkgver}
  cp -r ${srcdir}/common ./
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd gstreamer-libde265-${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -f $pkgdir/usr/bin/*
}
