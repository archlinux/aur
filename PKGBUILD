# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libxslt-git
pkgver=1.1.37.r131.g075b6087
pkgrel=1
pkgdesc="XML stylesheet transformation library"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
license=('custom')
depends=('glibc' 'libgcrypt' 'libxml2')
makedepends=('git')
provides=("libxslt=$pkgver")
conflicts=('libxslt')
options=('staticlibs')
source=("git+https://gitlab.gnome.org/GNOME/libxslt.git")
sha256sums=('SKIP')


pkgver() {
  cd "libxslt"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libxslt"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libxslt"

  #make check
}

package() {
  cd "libxslt"

  make DESTDIR="$pkgdir" install
  install -Dm644 "Copyright" -t "$pkgdir/usr/share/licenses/libxslt"
}
