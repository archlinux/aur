# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xorgxrdp-devel-git
pkgver=0.2.15.r8.g9b7dd05
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
source=("git+https://github.com/neutrinolabs/xorgxrdp.git#branch=devel")
sha256sums=('SKIP')


pkgver() {
  cd "xorgxrdp"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "xorgxrdp"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "xorgxrdp"

  #make check
}

package() {
  cd "xorgxrdp"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/xorgxrdp"
}
