# Maintainer: willemw <willemw12@gmail.com>

pkgname=indicator-sensors
pkgver=1.3
pkgrel=1
pkgdesc="Hardware sensor monitor AppIndicator (temperatures, fan speeds, voltages, ...)"
arch=('x86_64')
url="https://github.com/alexmurray/indicator-sensors"
license=('GPL3')
depends=('ayatana-ido'
         'dconf'
         'gobject-introspection'
         'libappindicator-gtk3'
         'libatasmart'
         'libayatana-appindicator'
         'libayatana-indicator'
         'libnotify'
         'libpeas'
         'lm_sensors'
         'udisks2')
optdepends=('libxnvctrl: NVIDIA GPU support')
makedepends=('gnome-common' 'intltool')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('95a94b688666658ed4472072334a52e8231d4352aaefb9066d141efab846454c')

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

