# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libxml2-git
pkgver=2.9.9.rc2.r1.g6fc04d71
pkgrel=1
pkgdesc="The XML C parser and toolkit of Gnome"
arch=('i686' 'x86_64')
url="http://xmlsoft.org/"
license=('MIT')
depends=('glibc' 'icu' 'sh' 'xz' 'zlib')
makedepends=('git')
provides=('libxml2')
conflicts=('libxml2')
options=('staticlibs')
source=("git+https://gitlab.gnome.org/GNOME/libxml2.git")
sha256sums=('SKIP')


pkgver() {
  cd "libxml2"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libxml2"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --with-history \
    --with-icu
  make
}

check() {
  cd "libxml2"

  make check
}

package() {
  cd "libxml2"

  make DESTDIR="$pkgdir" install
  install -Dm644 "Copyright" "$pkgdir/usr/share/licenses/libxml2/Copyright"
}
