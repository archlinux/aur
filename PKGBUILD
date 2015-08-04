# $Id: PKGBUILD 116594 2014-07-30 16:26:30Z bgyorgy $
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=metacity-git
_pkgname=metacity
pkgver=3.14.1.r2.g246dc66
pkgrel=1
pkgdesc="Legacy GNOME window manager"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'libcanberra' 'libgtop' 'libsm' 'gsettings-desktop-schemas' 'gtk3' 'startup-notification' 'zenity')
makedepends=('git' 'gnome-common' 'intltool' 'yelp-tools')
conflicts=($_pkgname)
provides=($_pkgname)
url="https://wiki.gnome.org/Projects/Metacity"
install=metacity.install
source=(git://git.gnome.org/metacity)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
               --disable-static --disable-schemas-compile
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
