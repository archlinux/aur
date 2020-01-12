# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Max Bruckner <max at maxbruckner dot de>

pkgname=smooth
pkgver=0.9.1
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://www.smooth-project.org/"
license=('Artistic2.0')
depends=('curl' 'fribidi' 'gtk3' 'libjpeg-turbo' 'libxml2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/enzo1982/smooth/archive/v${pkgver}.tar.gz")
sha512sums=('9cab9d4a06eae37cb3024feb3fee73ae2de47723c03a5d0b9d75afda379049c16ee572ebfe024cfd73cf16942829c9731cc56568cfe84f1d222f6d016e999f8b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  make DESTDIR="${pkgdir}" install
  ln -s "/usr/lib/libsmooth-${pkgver%.*}.so" "${pkgdir}/usr/lib/libsmooth.so"
}
