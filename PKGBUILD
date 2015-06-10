# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: anonymous_user <31337h4ck3r at gmail dot com>
# Contributor: Christoph Zeiler <rabyteNOSPAM_at_gmx.dot.org>

pkgname=mount-gtk2-git
_pkgname=mount-gtk
epoch=1
pkgver=1.4.3.r2.g386125b
pkgrel=1
pkgdesc="A graphical front end for udisks and mount"
arch=('i686' 'x86_64')
url="http://mount-gtk.sourceforge.net/"
license=('GPL')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
makedepends=('git')
depends=('c++-gtk-utils-gtk2' 'udisks2' 'libnotify')
options=('!buildflags' '!emptydirs')
source=($pkgname::git://mount-gtk.git.sourceforge.net/gitroot/mount-gtk/mount-gtk)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "1.4.3.r%s.g%s" "$(git rev-list --count a8c9118b..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --with-gtk-version=gtk2
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
