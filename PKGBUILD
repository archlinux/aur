# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=gst-omx
pkgver=1.12.1
pkgrel=1
pkgdesc="Gstreamer OpenMAX IL wrapper Plugin"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('gst-plugins-bad' 'mesa')
makedepends=('python')
options=(!libtool)
source=("https://gstreamer.freedesktop.org/src/$pkgname/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('13faf0eb679c37a01f64c47f23018c2d894fa0ff1c3b98d4b1d1c69a7b3ca183'
            'SKIP')
validpgpkeys=('7F4BC7CC3CA06F97336BBFEB0668CC1486C2D7B5') # Sebastian Dröge

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-experimental \
    --with-package-name="GStreamer OpenMAX IL wrapper Plugin (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --with-omx-target=generic
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
