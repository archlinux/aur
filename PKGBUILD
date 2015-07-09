# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
pkgname=gnome-shell-pomodoro
pkgver=0.11.0
pkgrel=2
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/codito/gnome-shell-pomodoro/'
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'upower' 'gstreamer' 'gobject-introspection')
makedepends=('intltool' 'vala' 'gnome-common')
conflicts=('gnome-shell-pomodoro-git')
install='gschemas.install'
changelog='NEWS'
source=("$pkgname-$pkgver.tar.gz::https://github.com/codito/gnome-pomodoro/archive/$pkgver.tar.gz")
sha256sums=('06693d4858d7d96c36f93afd2a3c352bbaeea90e67839a7669a9f0f1fe4e825c')

prepare() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  # Fixes some build issues when 'docbook2x' package is installed
  # Big thanks to user maus25 for the fix
  sed -i "s/docbook2man \$?/docbook2man --sgml \$?/g" man/Makefile.am
}

build() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  ./autogen.sh --prefix=/usr --datadir=/usr/share
  make
}

package() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  make DESTDIR="$pkgdir" install
}
