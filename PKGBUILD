# Maintainer:  Jonas Malaco <jonas@protocubo.io>
pkgname=libopenusb
pkgver=1.1.14
pkgrel=1
pkgdesc='An MT-safe libusb0'
arch=(x86_64)
url='https://sourceforge.net/projects/openusb'
license=(LGPL)
depends=(glibc systemd-libs)
makedepends=(systemd)
provides=(libopenusb.so)
source=("$pkgname-$pkgver.tar.gz::https://master.dl.sourceforge.net/project/openusb/libopenusb/libopenusb-$pkgver/libopenusb-$pkgver-0.tar.gz"
        'fix-parallel-builds-of-documentation.patch'
        'fix-inline-function-declariation-without-definition.patch')
md5sums=('00973b00ae2d0370aa6b878fc1c3c555'
         '657348a9113f2dfe39a2ac687d5d0237'
         'f5ab870d39e8bda7e677e824d292e7ed')

build() {
  cd $pkgname-$pkgver
  patch --forward --strip=1 --input="${srcdir}/fix-parallel-builds-of-documentation.patch"
  patch --forward --strip=1 --input="${srcdir}/fix-inline-function-declariation-without-definition.patch"
  ./configure --prefix=/usr
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package () {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
