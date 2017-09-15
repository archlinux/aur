# Taken from the ABS
# Maintainer: David Koňařík <dvd.kon@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: <david@pako.st>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=chicken-noconflict
pkgver=4.12.0
pkgrel=3
pkgdesc='A chicken package for use with mono-noconflict'
arch=('x86_64' 'i686')
url='http://call-cc.org/'
# This conflicts with most mono packages, but not mono-noconflict, but there's
# no way to "declare compatibility"
conflicts=('chicken')
provides=("chicken=${pkgver}")
license=('BSD')
makedepends=('inetutils')
options=('staticlibs')
source=("https://code.call-cc.org/releases/$pkgver/chicken-$pkgver.tar.gz") # ${pkgver%.*}
sha256sums=('605ace459bc66e8c5f82abb03d9b1c9ca36f1c2295931d244d03629a947a6989')

build() {
  make -j1 -C "chicken-$pkgver" PLATFORM=linux PREFIX=/usr
}

package() {
  cd "chicken-$pkgver"
  make -j1 PLATFORM=linux PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: code.call-cc.org/releases/current/NEWS
# vim: ts=2 sw=2 et:
