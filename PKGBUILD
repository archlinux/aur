# Maintainer: Luna Jernberg <lunajernberg@gnome.org>
# Co-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=gnome-radio
pkgver=83.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://www.gnomeradio.org"
license=(GPL-3.0-only)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib-2' 'goocanvas2')
makedepends=('intltool' 'itstool' 'python')
conflicts=('gnome-internet-radio-locator')
replaces=('gnome-internet-radio-locator')
source=(http://www.gnomeradio.org/src/gnome-radio-83.0.tar.xz)
sha256sums=('5762440e3023859d4d8635086f220ddebbd0be2eb75177127ff896c68ec12497')

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

