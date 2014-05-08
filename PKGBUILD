# $Id: PKGBUILD 198265 2013-10-30 13:49:06Z allan $
# Maintainer: Jan de Groot  <jgc@archlinux.org>
pkgname=libwnck-git
pkgver=2.31.0.r2.gf94e313
pkgrel=1
pkgdesc="Window Navigator Construction Kit"
arch=('i686' 'x86_64')
license=('LGPL')
provides=('libwnck')
conflicts=('libwnck')
depends=('gtk2' 'startup-notification' 'libxres')
makedepends=('git' 'libxt' 'intltool' 'gobject-introspection' 'gnome-common')
url="http://www.gnome.org/"
source=("$pkgname::git://git.gnome.org/libwnck#branch=gnome-2-32")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,LIBWNCK_,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc \
	--localstatedir=/var --disable-static \
	--disable-tools
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
