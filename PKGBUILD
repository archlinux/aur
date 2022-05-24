# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>

pkgname=flatcc
pkgver=0.6.1
pkgrel=1
pkgdesc="FlatBuffers Compiler and Library in C for C"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('cmake')
url="https://github.com/dvidelabs/flatcc"
license=('Apache')
options=('staticlibs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/dvidelabs/flatcc/archive/v${pkgver}.tar.gz")
sha256sums=('2533c2f1061498499f15acc7e0937dcf35bc68e685d237325124ae0d6c600c2b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build && cd build

  cmake \
    -DBUILD_SHARED_LIBS=on \
    -DFLATCC_ALLOW_WERROR=off \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFLATCC_INSTALL=on \
    ..

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 *.md doc/* -t "${pkgdir}/usr/share/doc/${pkgname}"

  cd build
  make DESTDIR="${pkgdir}" install
}
