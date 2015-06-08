# Maintainer: willemw <willemw12@gmail.com>

pkgname=indicator-sensors
pkgver=0.8
pkgrel=2
pkgdesc="Small application to provide hardware sensor readings using the AppIndicator framework"
arch=('i686' 'x86_64')
url="https://github.com/alexmurray/indicator-sensors"
license=('GPL3')
depends=('dconf' 'libappindicator-gtk3' 'libatasmart' 'libnotify' 'libpeas' 'lm_sensors' 'udisks2')
optdepends=('libxnvctrl: NVIDIA GPU support')
makedepends=('gnome-common' 'intltool')
install=$pkgname.install
source=(https://github.com/alexmurray/$pkgname/archive/$pkgver.tar.gz)
md5sums=('2975c3b04778e18b549356383a3740d8')

prepare() {
  cd $pkgname-$pkgver

  # Fix autogen with latest gnome-common
  # Side-by-side use of IT_PROG_INTLTOOL and AM_GNU_GETTEXT is not supported.
  #sed -i "s|\(^AM_GNU_GETTEXT\)|#\1|" configure.ac
}

build() {
  cd $pkgname-$pkgver
  sh ./autogen.sh
  ./configure --disable-schemas-compile --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

