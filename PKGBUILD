# $Id: PKGBUILD 278376 2016-10-12 09:08:03Z jgc $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Updated by Andrew Rembrandt andrew@rembrandt.me.uk to point to master branch

_pkgname=gnome-logs
pkgname=$_pkgname-git
pkgver=3.23.2+2+ga24c9da
pkgrel=1
pkgdesc="A log viewer for the systemd journal"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Logs"
license=(GPL)
#groups=(gnome-extra)
depends=(systemd gtk3 gsettings-desktop-schemas)
makedepends=(intltool itstool gnome-common appstream-glib git)
conflicts=(gnome-logs)
source=("git://git.gnome.org/gnome-logs#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^gnome-logs-//;s/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
