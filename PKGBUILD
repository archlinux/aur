# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libaio-git
pkgver=0.3.113.r0.g1b18bfa
pkgrel=1
pkgdesc="The Linux-native asynchronous I/O facility (aio) library"
arch=('i686' 'x86_64')
url="https://pagure.io/libaio"
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=("libaio=$pkgver" "libaio.so")
conflicts=('libaio')
options=('staticlibs')
source=("git+https://pagure.io/libaio.git")
sha256sums=('SKIP')


pkgver() {
  cd "libaio"

  git describe --long --tags | sed 's/^libaio.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libaio"

  make
}

check() {
  cd "libaio"

  #make partcheck
}

package() {
  cd "libaio"

  make DESTDIR="$pkgdir" install
  install -Dm644 {ChangeLog,README.md} -t "$pkgdir/usr/share/doc/libaio"
  install -Dm644 man/*.3 -t "$pkgdir/usr/share/man/man3"
}
