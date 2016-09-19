# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=pnmixer-git
pkgver=0.7.r0.ge4dc99c
pkgrel=1
pkgdesc="GTK volume mixer applet that runs in the system tray."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/nicklan/pnmixer"
provides=('pnmixer')
conflicts=('pnmixer')
makedepends=('intltool')
depends=('gtk2' 'alsa-lib' 'libnotify')
source=("$pkgname::git+https://github.com/nicklan/pnmixer.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname
  ./autogen.sh --without-gtk3 --prefix=/usr
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
