# Maintainer: Marcelina Szostak <kapcioszek2137 (at) gmail (dot) com>
# Contributor: Daniel YC Lin <dlin (at) gmail.com>

pkgname=bcpp
pkgver=20240917
pkgrel=1
pkgdesc="utility for indents C/C++ source programs"
arch=('i686' 'x86_64')
url="https://invisible-island.net/bcpp/bcpp.html"
license=("custom")
depends=(gcc-libs glibc)
source=(https://invisible-island.net/archives/${pkgname}/${pkgname}-${pkgver}.tgz)
b2sums=('f07998d42fd65c4b8f57b2d0873caca26bf8d63909ee3c5830a6e20d32235915f3090aac4b5f09e7f4694de9650bcad04c4aed3dc1b49e2e6db0d252ea7a09b0')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/etc"
  cp code/bcpp.cfg "$pkgdir/etc/"
  mkdir -p "$pkgdir/usr/share/licenses/bcpp"
  install -m644 COPYING "$pkgdir/usr/share/licenses/bcpp/"
}

