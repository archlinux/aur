pkgname=mal-gtk-git
_pkgname=mal-gtk
epoch=1
pkgver=0.r178.g0ee0522
pkgrel=2
pkgdesc="GTK+3 anime manager interface for MyAnimeList.net"
arch=('i686' 'x86_64')
url="https://github.com/talisein/mal-gtk"
license=('GPL')
depends=('gnome-keyring' 'glibmm' 'gtkmm3' 'libsecret')
makedepends=('git' 'meson' 'perl-xml-parser')
provides=('mal-gtk')
conflicts=('mal-gtk')

source=("git://github.com/talisein/mal-gtk.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h" )"
}

build() {
  cd "$srcdir/$_pkgname"
  arch-meson build
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" ninja -C build install
}
