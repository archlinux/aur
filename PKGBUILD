# Maintainer: willemw <willemw12@gmail.com>

pkgname=indicator-sensors
pkgver=1.4
pkgrel=3
pkgdesc='Hardware sensor monitor AppIndicator (temperatures, fan speeds, voltages, ...)'
arch=(x86_64)
url=https://github.com/alexmurray/indicator-sensors
license=(GPL-3.0-or-later)
depends=(
  ayatana-ido
  dconf
  gobject-introspection
  libappindicator-gtk3
  libatasmart
  libayatana-appindicator
  libayatana-indicator
  libnotify
  libpeas
  lm_sensors
  udisks2)
optdepends=('libxnvctrl: NVIDIA GPU support')
makedepends=(glib2-devel gnome-common intltool)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('72bad13c56f56f27babcb354441fe9fed8ab10589d718889e7521c76a93007f8')

build() {
  cd $pkgname-$pkgver

  # sh ./autogen.sh
  mkdir -p m4
  autoreconf -fi -I /usr/share/gettext/m4

  ./configure --disable-schemas-compile --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
