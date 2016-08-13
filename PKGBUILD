# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: maus25 <mirko378@gmail.com>

pkgname=gnome-shell-pomodoro
pkgver=0.12.2
pkgrel=1
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/codito/gnome-shell-pomodoro/'
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'upower' 'gstreamer' 'gobject-introspection' 'perl-xml-sax-expat' 'telepathy-glib' 'libpeas')
makedepends=('intltool' 'vala' 'gnome-common' 'docbook2x')
conflicts=('gnome-shell-pomodoro-git')
changelog='NEWS'
source=("https://github.com/codito/gnome-pomodoro/archive/$pkgver.tar.gz")
sha256sums=('8c20f2024877c0227241a730d46c5437be92b7c234f664e3b7853016e7c9bda9')

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
