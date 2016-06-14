# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: maus25 <mirko378@gmail.com>

pkgname=gnome-shell-pomodoro
pkgver=0.11.3
pkgrel=1
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/codito/gnome-shell-pomodoro/'
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'upower' 'gstreamer' 'gobject-introspection' 'perl-xml-sax-expat' 'telepathy-glib' 'libpeas')
makedepends=('intltool' 'vala' 'gnome-common' 'docbook2x')
conflicts=('gnome-shell-pomodoro-git')
install='gschemas.install'
changelog='NEWS'
source=("$pkgname-$pkgver.tar.gz::https://github.com/codito/gnome-pomodoro/archive/$pkgver.tar.gz")
sha256sums=('4f1c9c42a11b9fdb6bac4d49773ec9717f9f2687c078d607b94d90a8f5f71fb6')

prepare() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  # Fixes some build issues when 'docbook2x' package is installed
  # Big thanks to user maus25 for the fix
  sed -i "s/docbook2man \$?/docbook2man --sgml \$?/g" man/Makefile.am

  ./autogen.sh --prefix=/usr --datadir=/usr/share
}

build() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  make
}

package() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  make DESTDIR="$pkgdir" install
}
