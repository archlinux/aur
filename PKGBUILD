# Maintainer: glatavento <glatavento at outlook dot com>

pkgname=libjaylink-git
pkgver=0.1.0.r20.gc2c4bb0
pkgrel=1
pkgdesc='Libjaylink is a shared library written in C to access SEGGER J-Link and compatible devices.'
arch=(x86_64)
url='https://github.com/syntacore/libjaylink'
license=('GPL2')
makedepends=('git')
optdepends=(
  'libusb'
  'doxygen: Required for API documentation'
) 
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}

