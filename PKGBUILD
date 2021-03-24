# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libexif-git
pkgver=0.6.22.r24.g977d8ff
pkgrel=1
pkgdesc="A library for parsing, editing and saving EXIF data"
arch=('i686' 'x86_64')
url="https://libexif.github.io/"
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=('libexif' 'libexif.so')
conflicts=('libexif')
options=('staticlibs')
source=("git+https://github.com/libexif/libexif.git")
sha256sums=('SKIP')


pkgver() {
  cd "libexif"

  git describe --long --tags | sed 's/^libexif-//;s/-release//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "libexif"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libexif"

  make check
}

package() {
  cd "libexif"

  make DESTDIR="$pkgdir" install
}
