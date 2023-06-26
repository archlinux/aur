# Contributor: masutu <masutu dot arch at gmail dot com>
# Contributor: archtux <antonio.arias99999@gmail.com>

_name=Movgrab
pkgname=movgrab
pkgver=3.1.2
pkgrel=1
pkgdesc="command-line movie downloader"
arch=('i686' 'x86_64')
url="https://github.com/ColumPaget/Movgrab"
license=('GPL3')
depends=('openssl-1.1')
source=($pkgname-$pkgver.tar.gz::https://github.com/ColumPaget/Movgrab/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('dcd98949f276bc722417f73ae4ddcd37b55c0ce857fb05bbc8311770c052c3d33f52e799ded59598366f03925ca58e3ea40997699deb2e7bd5ee9f8f37a299ea')

build() {
  cd $_name-$pkgver
  make clean
  ./configure --prefix=/usr \
      --enable-ssl \
      --enable-largefiles
  make
}

package() {
  cd $_name-$pkgver
  install -Dm755 movgrab "$pkgdir"/usr/bin/movgrab
  install -Dm644 README "$pkgdir"/usr/share/$pkgname/README
  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  install -m644 Docs/* "$pkgdir"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
