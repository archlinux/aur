# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libxcrypt-git
pkgver=4.4.17.r1.gb475497
pkgrel=1
pkgdesc="Library for one-way hashing of passwords"
arch=('i686' 'x86_64')
url="https://github.com/besser82/libxcrypt/"
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=('libxcrypt' 'libcrypt.so')
conflicts=('libxcrypt')
options=('staticlibs')
source=("git+https://github.com/besser82/libxcrypt.git")
sha256sums=('SKIP')


pkgver() {
  cd "libxcrypt"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libxcrypt"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --disable-failure-tokens \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=no
  make
}

check() {
  cd "libxcrypt"

  make check
}

package() {
  cd "libxcrypt"

  make DESTDIR="$pkgdir" install
}
