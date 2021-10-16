# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libffi-git
pkgver=3.4.2.r20.g0f2dd36
pkgrel=1
pkgdesc="Portable foreign function interface library"
arch=('i686' 'x86_64')
url="https://sourceware.org/libffi/"
license=('MIT')
depends=('glibc')
makedepends=('git')
checkdepends=('dejagnu')
provides=('libffi' 'libffi.so')
conflicts=('libffi')
options=('staticlibs')
source=("git+https://github.com/libffi/libffi.git")
sha256sums=('SKIP')


pkgver() {
  cd "libffi"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libffi"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-pax_emutramp
  make
}

check() {
  cd "libffi"

  #make check
}

package() {
  cd "libffi"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libffi"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/libffi"
}
