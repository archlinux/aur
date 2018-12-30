# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-internet-radio-locator
pkgver=1.5.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/InternetRadioLocator"
license=(GPL)
depends=('libchamplain' 'geocode-glib' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('intltool' 'itstool' 'python' 'gtk-doc' 'yelp-tools')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('fd6ce280afc89cfad3ed864f90c3dd8892b9c75811b7805cbc3dbacf78d78524')

prepare() {
  cd $pkgname-$pkgver
    # disable pkgconfig for gst-plugins-good, as it currently doesn't have .pc file
  sed -i '/gstreamer-plugins-good-1.0 \\/d' configure.ac
  autoreconf
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check(){
  cd $pkgname-$pkgver
  make check
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
