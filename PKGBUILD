# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
pkgname=gnome-shell-pomodoro-git
pkgver=r674.eda26b4
pkgrel=1
pkgdesc="A time management utility for GNOME based on the pomodoro technique"
arch=('i686' 'x86_64')
url="https://github.com/codito/gnome-shell-pomodoro/"
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'upower' 'gstreamer' 'gom' 'gobject-introspection')
makedepends=('intltool' 'vala' 'gnome-common')
conflicts=('gnome-shell-pomodoro')
provides=('gnome-shell-pomodoro')
source=("$pkgname"::'git+https://github.com/codito/gnome-shell-pomodoro.git')
sha256sums=('SKIP')
install='gschemas.install'

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr --datadir=/usr/share
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
