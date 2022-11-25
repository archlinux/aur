# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=cursynth
pkgname=${_pkgname}-git
pkgver=20150622.r219.578b43c
pkgrel=2
pkgdesc='GNU ncurses terminal synthesizer'
url='http://gnu.org/software/cursynth'
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('ncurses' 'alsa-lib')
makedepends=('git')
source=("git+https://github.com/mtytel/cursynth")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  unset CFLAGS CXXFLAGS
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
