# Maintainer: Marius Schiffer <marius.schiffer@gmail.com>
pkgname=fpart
pkgver=1.2.0
pkgrel=1
pkgdesc='A tool that helps you sort file trees and pack them into bags, like dirsplit'
arch=('x86_64')
url='https://github.com/martymac/fpart'
license=('custom:BSD 2-clause')
depends=()
makedepends=('autoconf')
optdepends=('sh: fpsync synchronization tool')
source=("fpart-${pkgver}.tar.gz::https://github.com/martymac/fpart/archive/fpart-${pkgver}.tar.gz")
sha256sums=('ced59d68236d960473b5d9481f3d0c083f10a7be806c33125cc490ef2c1705f8')

build() {
  cd fpart-fpart-$pkgver
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd fpart-fpart-$pkgver
  make DESTDIR="$pkgdir/" install
  # Install license file
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
