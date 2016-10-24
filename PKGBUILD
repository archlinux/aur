# Maintainer: Joakim Reinert <mail+aur@jreinert.com>
# Contibutor: David Brazdil <db538@cam.ac.uk>

_name=volnoti-brightness
pkgname=volnoti-brightness-git
pkgver=0.1.r3.gc5a94af
pkgrel=2
pkgdesc="Lightweight volume and brightness notification for Linux using volnoti"
url="https://github.com/hcchu/volnoti"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('dbus' 'dbus-glib' 'gtk2' 'gdk-pixbuf2' 'librsvg')
makedepends=('git' 'pkg-config')
conflicts=('volnoti')
replaces=('volnoti')
provides=('volnoti')
source=("$_name::git+$url.git")
md5sums=(SKIP)

pkgver() {
  cd "$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_name"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/volnoti/COPYING"
}
# vim:set ts=2 sw=2 et:
