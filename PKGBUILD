# Maintainer: Millian Poquet <millian.poquet@gmail.com>
pkgname=intervalset
pkgver=1.2.0
pkgrel=3
pkgdesc='C++ library to manage sets of integral closed intervals — based on Boost.Icl'
arch=('i686' 'x86_64')
url='https://framagit.org/batsim/intervalset'
license=('LGPL-3.0')
source=('https://framagit.org/batsim/intervalset/-/archive/v1.2.0/intervalset-v1.2.0.tar.gz')
depends=('boost')
makedepends=('meson' 'ninja' 'gtest')
md5sums=('8ac913678803166a6db4f21636000274')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  meson --prefix=/usr build
  ninja -C build
}

check() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    meson test -C build
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf build
}
