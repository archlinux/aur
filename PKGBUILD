# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=snowpack
pkgname=('snowpack' 'snowpack-docs')
pkgver=3.5.0
pkgrel=1
pkgdesc="Make data access easy and safe for numerical simulations in environmental sciences"
arch=('x86_64')
url="https://models.slf.ch/p/snowpack/"
license=('LGPL3')
depends=('meteoio')
makedepends=('cmake' 'doxygen')
source=("https://models.slf.ch/p/snowpack/downloads/get/Snowpack-$pkgver-src.tar.gz")

build() {
  cd "Snowpack-$pkgver-src"
  mkdir -p build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_DOC=1 .
  make
  make doc
}

package_snowpack() {
  cd "Snowpack-$pkgver-src"
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/share"
}

package_snowpack-docs() {
  cd "Snowpack-$pkgver-src/doc/html"
  mkdir -p "$pkgdir/usr/share/doc/snowpack"
  cp -r * "$pkgdir/usr/share/doc/snowpack"
}

sha256sums=('94cd59a97d3b3d9a40d8af3841207846b317c7c515be327731a02d4d7d37eb75')
