# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Guido Iodice <gmail.com: guido.iodice>

pkgname=gstreamer0.10-vaapi
pkgver=0.5.9
pkgrel=1
pkgdesc="A collection of VA-API based plugins for GStreamer (this is the last version compatible with GStreamer 0.10)"
url="https://wiki.freedesktop.org/www/Software/vaapi/"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('nasm')
depends=('gstreamer0.10-bad' 'libva')
optdepends=('libva-wayland: Wayland support'
            'xvba-video: for ATI chipsets'
	    'libva-vdpau-driver: for nVidia chipsets'
	    'libva-intel-driver: for Intel chipsets')
source=("http://www.freedesktop.org/software/vaapi/releases/gstreamer-vaapi/gstreamer-vaapi-${pkgver}.tar.bz2")
sha256sums=('b5efbb5ccd3e9fd1ce16193dd14cfac327a8ec2662794c0067ff2603c3355003')
options=('!libtool')

build() {
  cd "${srcdir}/gstreamer-vaapi-${pkgver}"
  LIBS=-ldl ./configure  --prefix=/usr --disable-static --with-gstreamer-api=0.10
  sed 's|^LIBS =|LIBS = -lgstbasevideo-0.10 |'  -i tests/Makefile
  make
}

package() {
  cd "${srcdir}/gstreamer-vaapi-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
