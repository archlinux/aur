# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-internet-radio-locator
pkgver=12.7.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=(x86_64)
url="http://gnomeradio.org"
license=(GPL3)
depends=(libchamplain geoclue gst-plugins-base gst-plugins-bad geocode-glib-2)
makedepends=(intltool itstool python gtk-doc)
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('4db981efcf6607c906388c92c70a54d31afdd3bbcd86cfb9ba89f208af50d6b9')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/geocode-glib-1.0/geocode-glib-2.0/' configure.ac
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  CFLAGS+=" -Wno-implicit-function-declaration -Wno-int-conversion"
  ./configure --prefix=/usr --with-recording
  make
}

check(){
  cd $pkgname-$pkgver
  make check -k
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
