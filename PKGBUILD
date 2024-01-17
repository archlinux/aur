# Maintainer: Marek Küthe <m.k@mk16.de>

_pkgname=libtuntap
pkgname=libtuntap-git
pkgver=0.4.r70.g18ee864
pkgrel=1
pkgdesc="The portable Tun/Tap devices configuration utility"
arch=('x86_64')
url="https://github.com/LaKabane/libtuntap/"
license=('ISC')
makedepends=('git' 'cmake')
source=('git+https://github.com/LaKabane/libtuntap.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^libtuntap-//' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "$_pkgname"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
