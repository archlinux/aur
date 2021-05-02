# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=snowpack
pkgname=('snowpack' 'snowpack-docs')
pkgver=3.6.0
pkgrel=1
pkgdesc="Make data access easy and safe for numerical simulations in environmental sciences"
arch=('x86_64')
url="https://models.slf.ch/p/snowpack/"
license=('LGPL3')
depends=('meteoio')
makedepends=('cmake' 'doxygen')
source=("https://gitlabext.wsl.ch/snow-models/snowpack/-/archive/Snowpack-$pkgver/snowpack-Snowpack-$pkgver.tar.gz")
sha256sums=('e3ef84ebd18d31ffd63c2bae3b99f3a88d3f9c0c9bfa45b0577a4beb08f7ed3d')

build() {
  cd "snowpack-Snowpack-$pkgver"
  mkdir -p build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_DOC=1 .
  make
  make doc
}

package_snowpack() {
  cd "snowpack-Snowpack-$pkgver"
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/share"
}

package_snowpack-docs() {
  cd "snowpack-Snowpack-$pkgver/doc/html"
  mkdir -p "$pkgdir/usr/share/doc/snowpack"
  cp -r * "$pkgdir/usr/share/doc/snowpack"
}

