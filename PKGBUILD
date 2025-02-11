# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=tascam.lv2-git
pkgver=r16.443853f
pkgrel=1
pkgdesc="Tascam US-16x08 LV2 plugin"
arch=('x86_64')
url="https://github.com/onkelDead/tascam.lv2"
license=('GPL')
depends=('gtkmm3' 'libxml++-5.0' 'liblo' 'base-devel')
makedepends=('git' 'autoconf' 'automake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/onkelDead/tascam.lv2.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tascam.lv2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/tascam.lv2"
  autoreconf -fiv
}

build() {
  cd "$srcdir/tascam.lv2"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/tascam.lv2"
  make DESTDIR="$pkgdir/" install
}
