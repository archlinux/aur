# Maintainer: Bartłomiej Szostak <kapcioszek2137@gmail.com>
# Contributor: Daniel YC Lin <dlin (at) gmail.com>

pkgname=bcpp
pkgver=20240111
pkgrel=1
pkgdesc="utility for indents C/C++ source programs"
arch=('i686' 'x86_64')
url="https://invisible-island.net/bcpp/bcpp.html"
license=("custom")
depends=(gcc-libs glibc)
source=(https://invisible-island.net/archives/${pkgname}/${pkgname}-${pkgver}.tgz)
b2sums=('9bcb986bd434e8c574a25d5e6a4dab08f5aec342bd60e46110902e7f5d924fff4295fc23ee5fc9190ef10c36fa89b19d9f2baff79150899f7618c06df543ae88')

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

