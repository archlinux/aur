# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Max Bruckner <max at maxbruckner dot de>

pkgname=smooth
pkgver=0.9.10
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('x86_64')
url="http://www.smooth-project.org/"
license=('Artistic-2.0')
depends=('curl' 'fribidi' 'gtk3' 'libjpeg-turbo' 'libxml2')
provides=('libsmooth-0.9.so')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/enzo1982/smooth/archive/v${pkgver}.tar.gz")
sha512sums=('29166c31ec3763f434ff39494f4d3c94b79a8f087f9001e03f37a44664f140b8a1be69e06d5fe6cb79e8e35711fd2fb01d6f306c1bf6f96a30a2586604b57707')

prepare() {
  cd "${pkgname}-${pkgver}"
  find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  ln -s "/usr/lib/libsmooth-${pkgver%.*}.so" "${pkgdir}/usr/lib/libsmooth.so"
}
