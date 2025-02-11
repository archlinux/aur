# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=tascam-gtk-git
pkgver=r77.6419a3b
pkgrel=1
pkgdesc="GTK application to control Tascam US-16x08 USB audio interface"
arch=('x86_64')
url="https://github.com/onkelDead/tascam-gtk"
license=('GPL')
depends=('gtkmm3' 'libxml++-5.0' 'liblo' 'base-devel')
makedepends=('git' 'autoconf' 'automake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/onkelDead/tascam-gtk.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tascam-gtk"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/tascam-gtk"
  autoreconf -fiv
}

build() {
  cd "$srcdir/tascam-gtk"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/tascam-gtk"
  make DESTDIR="$pkgdir/" install
}
