# Based on the file created for Arch Linux by:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>
# Maintainer: Andrey Vetrov <vetrov at mail dot ru>
#
# Removed webkit2gtk dependency:
# https://github.com/QubesOS/qubes-issues/issues/3279
# https://bugs.archlinux.org/task/50548

pkgname=zenity-git
pkgver=3.32.0.r5.gcd63631
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts. Webkit-free version."
url="https://gitlab.gnome.org/GNOME/zenity"
arch=(x86_64)
license=(LGPL)
provides=("zenity=$pkgver")
conflicts=('zenity')
replaces=('zenity')
depends=('libnotify')
makedepends=(gettext gnome-common git itstool yelp-tools)
source=("git+https://gitlab.gnome.org/GNOME/zenity.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^ZENITY_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-*}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname%-*}
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --disable-webkitgtk \
      --localstatedir=/var
  make
}

package() {
  cd ${pkgname%-*}
  make DESTDIR="${pkgdir}" install
}
