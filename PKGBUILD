# Maintainer: Luna Jernberg <lunajernberg@gnome.org>
# Co-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=gnome-radio
pkgver=48.4
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib-2')
makedepends=('intltool' 'itstool' 'python')
conflicts=('gnome-internet-radio-locator')
replaces=('gnome-internet-radio-locator')
source=(http://www.gnomeradio.org/src/gnome-radio-48.4.tar.xz)
sha256sums=('7fdc68035f32ca6aaacc05d425a0e50fb8ecf8ba99627028f71b009dec71f749')

prepare() {
  cd $pkgname-$pkgver
  # https://gitlab.gnome.org/ole/gnome-radio/-/issues/4
  sed -i 's|geocode-glib-1.0|geocode-glib-2.0|' configure
}

build() {
  cd $pkgname-$pkgver
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

