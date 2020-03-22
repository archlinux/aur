# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Max Bruckner <max at maxbruckner dot de>

pkgname=smooth
pkgver=0.9.4
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://www.smooth-project.org/"
license=('Artistic2.0')
depends=('curl' 'fribidi' 'gtk3' 'libjpeg-turbo' 'libxml2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/enzo1982/smooth/archive/v${pkgver}.tar.gz")
sha512sums=('dbe444157c29518d8989f5cd8e8d9cd21f6d769a83ecc4dd54b7817b67bc960431f7cc370f6baadfcc9aac63c26b210422eaa929b91d0c5c4c435f24928ac621')

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
