# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=leafpad-qtify
pkgver=0.8.19
pkgrel=1
_commit=3b1a2c2a1fad10f7f03e9b240bb6fa425aed5417
pkgdesc="Leafpad (the GTK 2 text editor) built on Qt with GTK made Qt"
arch=(x86_64 aarch64)
url="https://github.com/tarot231/leafpad"
license=(GPL-2.0-or-later)
depends=(qt6-base glib2 cairo pango)
makedepends=(gtk-made-qt autoconf automake intltool pkgconf)
provides=(leafpad)
conflicts=(leafpad)
source=("leafpad-${_commit}.tar.gz::https://github.com/tarot231/leafpad/archive/${_commit}.tar.gz")
sha256sums=('a57774ef72694758fe61e8a9cc151c394d3a2a3c5c9cf3ff3c2d874bb1926115')

build() {
  cd "leafpad-${_commit}"
  intltoolize --force
  autoreconf -fi
  gtk-made-qt-env ./configure --prefix=/usr
  gtk-made-qt-env make
}

check() {
  cd "leafpad-${_commit}"
  QT_QPA_PLATFORM=offscreen GTKQT_AUTOQUIT=1000 ./src/leafpad
}

package() {
  cd "leafpad-${_commit}"
  make DESTDIR="$pkgdir" install
}

