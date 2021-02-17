# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Max Bruckner <max at maxbruckner dot de>

pkgname=smooth
pkgver=0.9.7
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://www.smooth-project.org/"
license=('Artistic2.0')
depends=('curl' 'fribidi' 'gtk3' 'libjpeg-turbo' 'libxml2')
provides=('libsmooth-0.9.so')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/enzo1982/smooth/archive/v${pkgver}.tar.gz")
sha512sums=('d3def3859f24222bd2c46e47d9e9b7208dadaa460b60c0937a62e549565a01f8f1af9eef454914d7b0be69ab76b5057292861de6472be381cfae2fb5281a30dc')

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
