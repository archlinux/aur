# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Old maintainer: Kozec <kozec at kozec dot com>
# Contributor: Alex Anthony <alex.anthony28991 at googlemail.com>
# Adapted from PKGBUILD by atie H. <atie.at.matrix@gmail.com>

_realname='clutter-gst'
pkgname="$_realname-git"
pkgver=2.99.5.651.08ce0ee 
pkgrel=1
pkgdesc="A GStreamer integration library for Clutter"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('clutter>=1.18.0' 'gstreamer')
makedepends=('gtk-doc' 'git')
options=('!libtool')
provides=('clutter-gst='$pkgver)
conflicts=('clutter-gst')
source=(git://git.gnome.org/clutter-gst)
md5sums=('SKIP')

subver() {
  PREFIX="m4_define(clutter_gst_$1_version, "
  echo $(grep $PREFIX configure.ac | eval sed "'s/$PREFIX//'" | sed 's/)//')
}
 
pkgver() {
  cd $_realname
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(subver major).$(subver minor).$(subver micro).$revision.$hash
}

build() {
  cd $_realname
  ./autogen.sh --prefix=/usr
  make
}
 
package() {
  cd $_realname
  make DESTDIR="$pkgdir" install
}
