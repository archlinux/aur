# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=exif-git
pkgver=0.6.22.r62.g0059882
pkgrel=1
pkgdesc="Command-line utility to show EXIF information"
arch=('i686' 'x86_64')
url="https://libexif.github.io/"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libexif' 'popt')
makedepends=('git')
provides=("exif=$pkgver")
conflicts=('exif')
source=("git+https://github.com/libexif/exif.git")
sha256sums=('SKIP')


pkgver() {
  cd "exif"

  git describe --long --tags | sed 's/^exif-//;s/-release//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "exif"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "exif"

  make check
}

package() {
  cd "exif"

  make DESTDIR="$pkgdir" install
}
