# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=qhull-7
_pkgname=qhull
pkgver=2019.1
_pkgver=7.3.2
pkgrel=1
pkgdesc="A general dimension code for computing convex hulls and related structures (shared lib in version 7)"
arch=(x86_64)
url="http://www.qhull.org/"
license=(custom)
depends=(glibc)
makedepends=(cmake ninja)
source=("http://www.qhull.org/download/qhull-${pkgver%.*}-src-$_pkgver.tgz")
sha256sums=('2b7990558c363076261564f61b74db4d0d73b71869755108a469038c07dc43fb')

build() {
  cmake -GNinja -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
  cmake --build build --target libqhull # deprecated, needed by octave
}

package() { 
  # only install libraries, no includes or anything
  # if you want to link against qhull, use the qhull latest
  mkdir -p "$pkgdir"/usr/lib
  cp -P build/libqhull.so.* "$pkgdir"/usr/lib/

  # Install license
  install -Dm644 "$srcdir"/$_pkgname-$pkgver/COPYING.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
