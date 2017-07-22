# Maintainer: Rostislav Uralskiy <rolex@ukr.net>

_pkgname=libusbgx
pkgname=$_pkgname-git
pkgver=r325.b8941d1
pkgrel=2
pkgdesc="C library encapsulating the kernel USB gadget-configfs userspace API functionality"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/libusbgx/libusbgx"
provides=("$_pkgname")
depends=('libconfig')
license=('LGPL')
source=("$_pkgname::git+https://github.com/libusbgx/libusbgx.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    autoreconf -i
    ./configure --prefix=/usr
    make -j1
}

package () {
  make -C "$_pkgname" DESTDIR="$pkgdir" install
  cd "$_pkgdir"
  rm -rf $pkgdir/usr/bin
}
