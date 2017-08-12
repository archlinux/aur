# Maintainer: Brian Bidlock <bidulock@openss7.org>
# Contributor: Nezmer <Nezmer@allurelinux.org>

pkgname=libsoup-gnome-git
pkgver=2.59.90.1.r0.gf7c7054b
pkgrel=1
pkgdesc="Gnome HTTP Library with gnome integration enabled /git repo"
epoch=1
arch=('i686' 'x86_64')
url="http://live.gnome.org/LibSoup"
license=('LGPL')
depends=('gnome-keyring' 'libproxy' 'glib-networking' 'sqlite')
makedepends=('intltool' 'gtk-doc' 'git' 'gnome-common' 'vala' 'python')
provides=('libsoup' 'libsoup-gnome')
conflicts=('libsoup' 'libsoup-gnome')
options=('!libtool')
source=("$pkgname::git://git.gnome.org/libsoup")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,^[a-zA-Z_]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
  --localstatedir=/var --disable-static --with-gnome --disable-gtk-doc
  make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install || return 1
}
