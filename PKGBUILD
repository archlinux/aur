# Maintainer: Mingkai Dong <mingkaidong@gmail.com>

pkgname=gf-complete-git
pkgver=a6862d1
pkgrel=1
pkgdesc="A library implements every Galois Field multiplication technique applicable to erasure coding for storage"
arch=('i686' 'x86_64')
url="https://github.com/ceph/gf-complete"
license=('custom')
#depends=('adb' 'fuse')
makedepends=('git' 'make' 'gcc')
source=()
md5sums=()

source=('git+https://github.com/ceph/gf-complete.git#branch=master')
_pkgname=gf-complete
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git rev-parse --short HEAD
}

build() {
  cd $_pkgname

  msg "Starting automake..."

  ./autogen.sh
  ./configure

  msg "Starting make..."
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
  # msg "Moving libgf_complete.la..."
  # install ./src/libgf_complete.la $pkgdir/usr/local/lib/libgf_complete.la
}
