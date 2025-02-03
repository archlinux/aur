# Maintainer: Marius Schiffer <marius.schiffer@gmail.com>
pkgname=fpart
pkgver=1.7.0
pkgrel=1
pkgdesc='A tool that helps you sort file trees and pack them into bags, like dirsplit'
arch=('x86_64')
url='https://github.com/martymac/fpart'
license=('BSD-2-Clause')
# Author only uploads signature to his website
source=("https://contribs.martymac.org/$pkgname/$pkgname-$pkgver.tar.gz"
  "https://contribs.martymac.org/$pkgname/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('61ce1603edba028495ab25d11007950bd932c9b01c11a8940d2b88cd3eac69e8'
  'SKIP')
validpgpkeys=('66F1D457E513A87460020C89F942ADECEDA0D50A')

build() {
  cd $pkgname-$pkgver
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  # Install license file
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
