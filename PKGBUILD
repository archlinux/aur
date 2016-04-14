# Maintainer: James An <james@jamesan.ca>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265
pkgver=0.9
pkgrel=3
pkgdesc="Open h.265 video codec implementation"
arch=('i686' 'x86_64')
url="https://github.com/strukturag/libde265"
license=('LGPL3')
depends=('sdl')
source=( "$url/archive/v$pkgver.tar.gz" )
md5sums=('c410f78fbba2f5739cef21ec344ac9ab')

prepare() {
  cd "$pkgname-$pkgver"
  sed -ri 's/(PIX_FMT_)/AV_\1/g' sherlock265/VideoDecoder.cc
}

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
