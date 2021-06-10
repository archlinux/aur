pkgname=pcb-rnd
pkgver=2.4.0
pkgrel=1
pkgdesc="free/open source, flexible, modular Printed Circuit Board editor"
url="http://repo.hu/projects/pcb-rnd/"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gtk2' 'gd' 'gtkglext' 'openmotif' 'libstroke')
# - glib and gtk if you are using the gtk frontend
# - openmotif or lesstif if you are using the lesstif frontend
# - gdlib if you are using the png HID
conflicts=('pcb-rnd-svn')
source=("http://repo.hu/projects/pcb-rnd/releases/pcb-rnd-$pkgver.tar.gz")
sha256sums=('7d8e8faa1b1fd001495a51d1a68d32ce5cf7620604c62952d88df105ffa47fde')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  # many knobs under ./configure --help
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  # prefix?  DESTDIR? install_root?
  make -j1 install_root="$pkgdir" install
}
