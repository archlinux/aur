# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Max Bruckner <max at maxbruckner dot de>

pkgname=smooth
pkgver=0.9.0
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://www.smooth-project.org/"
license=('Artistic2.0')
depends=('gtk3' 'libjpeg-turbo' 'libxmu' 'curl')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/enzo1982/smooth/archive/v${pkgver}.tar.gz" "glib2-include.patch")
sha512sums=('a27b2adfbc5d101444504a01d2e27efb8b6d97d186522c917908121d4def396afe2a74e344ab1f41a213a38afe3d167088f1bcac795d1da2dcb6b12c99cdc385'
            '5eea3bf95f84ff99bc35af54699f3dc00ff20eb7253a49f5b59fa12e60ee12e269715c54a6f99c380a17cf813d0b08738ce0ecb21c95d33f57e2ca8f56ea0bf1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  patch -Np1 -i "${srcdir}/glib2-include.patch"
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
