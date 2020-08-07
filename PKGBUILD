# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-faustgen
pkgver=0.1.2.1
pkgrel=1
pkgdesc="The FAUST compiler embedded in a Pd external"
arch=("i686" "x86_64")
license=('MIT')
url="https://github.com/agraef/$pkgname"
depends=('pd' 'llvm-libs')
makedepends=('faust' 'cmake' 'llvm')
source=("https://github.com/agraef/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('b3e2232d2dfc1ba2011e587a7f0442eb')

build() {
     cd "$pkgname-$pkgver"
     mkdir build && cd build
     cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DINSTALLED_FAUST=ON
     make
}

package() {
     cd "$pkgname-$pkgver/build"
     make install DESTDIR="$pkgdir"
}
