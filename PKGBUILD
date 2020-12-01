# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=zenity-light
pkgver=3.32.0+55+gd7bedff
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts. Light version without WekKit2."
url="https://gitlab.gnome.org/GNOME/zenity"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 libnotify)
makedepends=(yelp-tools autoconf-archive git perl)
conflicts=("${pkgname%-light}")
provides=("${pkgname%-light}")
_commit=d7bedff683df43df0604f989659df48f096f8c0e  # master
source=("git+https://gitlab.gnome.org/GNOME/zenity.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-light}
  git describe --tags | sed 's/^ZENITY_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd ${pkgbase%-light}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgbase%-light}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-webkitgtk
  make
}

package() {
  cd ${pkgbase%-light}
  make DESTDIR="$pkgdir" install
}
