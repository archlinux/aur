# Maintainer: Ashwin Vishnu <ashwinvis+arch at pm dot me>
# Contributor: Ivan <kaptoxic at yahoo com>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>

pkgname=gnome-shell-pomodoro-git
pkgver=0.14.0.r1.g7654eb7
pkgrel=1
_gitbranch='gnome-3.30'
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url="https://github.com/codito/gnome-pomodoro"
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'gstreamer' 'gobject-introspection' 'libpeas' 'appstream-glib')
makedepends=('intltool' 'vala' 'gnome-common' 'docbook2x' 'perl-xml-sax-expat')
conflicts=('gnome-shell-pomodoro')
provides=('gnome-shell-pomodoro')
source=("${pkgname}"::"git+https://github.com/codito/gnome-pomodoro.git#branch=${_gitbranch}")
sha256sums=('SKIP')
install=gschemas.install

pkgver() {
  cd "${srcdir}/${pkgname}"

  # Get the version number.
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh --prefix=/usr --datadir=/usr/share
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
