# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Pablo Lezaeta <prflr88 (arroba) gmail (dot) com<
# Contributor: peace4all <markspost at rocketmail dot com>
# Contributor: jase

pkgname=gstreamer0.10-fluendo
pkgver=0.10.85
pkgrel=3
pkgdesc="GStreamer 0.10 fluendo mpegdemux plugin"
provides=("gstreamer0.10-fluendo-mpegdemux")
arch=('i686' 'x86_64')
license=('MPL')
depends=('gstreamer0.10-base')
makedepends=('pkgconfig')
url="http://www.fluendo.com/products.php?product=plugins"
groups=('gstreamer0.10-plugins')
# source=("http://core.fluendo.com/gstreamer/src/gst-fluendo-mpegdemux/gst-fluendo-mpegdemux-${pkgver}.tar.bz2")
source=("http://sources.openembedded.org/gst-fluendo-mpegdemux-${pkgver}.tar.bz2")

build() {

  cd "${srcdir}/gst-fluendo-mpegdemux-${pkgver}"

  sed -i -e "s|GST_VER_1_0|GST_VER_0_0|" \
  -e "s|gstreamer-1.0 >= 1.0.0|gstreamer-0.0 >= 0.0.0|" \
  $(find . -name 'configure')

  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
  	--localstatedir=/var \
	--libexecdir=/usr/lib/gstreamer-0.10 \
	--sbindir=/usr/bin \
	--bindir=/usr/bin
  make
}

package() {

  cd "${srcdir}/gst-fluendo-mpegdemux-${pkgver}"
  make DESTDIR="${pkgdir}/" install sbindir=/usr/bin
}

md5sums=('7c4fb993f80b9ae631b11897733f0970')
