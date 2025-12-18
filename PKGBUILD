# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Max Bruckner <max at maxbruckner dot de>
pkgname=smooth
pkgver=0.9.10
pkgrel=2
pkgdesc="An object oriented C++ class library"
arch=('x86_64')
url="http://www.smooth-project.org/"
license=('Artistic-2.0')
depends=(
  'bzip2'
  'curl'
  'fribidi'
  'gtk3'
  'libcpuid'
  'libjpeg-turbo'
  'libpng'
  'libxml2'
)
provides=('libsmooth-0.9.so=0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/enzo1982/smooth/archive/v${pkgver}.tar.gz")
sha512sums=('29166c31ec3763f434ff39494f4d3c94b79a8f087f9001e03f37a44664f140b8a1be69e06d5fe6cb79e8e35711fd2fb01d6f306c1bf6f96a30a2586604b57707')

prepare() {
  cd "${pkgname}-${pkgver}"
  find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
  cd "${pkgname}-${pkgver}"
  make config=systemlibcpuid
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  ln -s "/usr/lib/libsmooth-${pkgver%.*}.so" "${pkgdir}/usr/lib/libsmooth.so"
}
