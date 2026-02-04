# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=aa-radio
pkgver=0.1.0
pkgrel=1
pkgdesc="Listen to Radio via CLI"
arch=('x86_64')
url="https://www.gnomeradio.org"
license=(GPL-3.0-only)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib-2')
makedepends=('intltool' 'itstool' 'python')
source=(https://www.aamot.org/software/aa-radio-0.1.0.tar.xz)
sha256sums=('2155ea4843f51950aeccbdf93d1222814085fb9011ababe46479ecfae4080a07')

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

