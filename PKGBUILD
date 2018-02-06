# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xorgxrdp-devel-git
pkgver=0.2.5.r1.g5efd502
pkgrel=1
pkgdesc="Xorg drivers for xrdp"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
depends=('glibc' 'xrdp')
makedepends=('git' 'nasm' 'xorg-server-devel')
provides=('xorgxrdp')
conflicts=('xorgxrdp')
options=('staticlibs')
source=("git+https://github.com/neutrinolabs/xorgxrdp.git")
sha256sums=('SKIP')


pkgver() {
  cd "xorgxrdp"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "xorgxrdp"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "xorgxrdp"

  #make check
}

package() {
  cd "xorgxrdp"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/xorgxrdp/COPYING"
}
