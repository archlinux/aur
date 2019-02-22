# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flatcc
pkgver=0.5.3
pkgrel=1
pkgdesc="FlatBuffers Compiler and Library in C for C"
arch=('i686' 'x86_64')
makedepends=('cmake')
url="https://github.com/dvidelabs/flatcc"
license=('Apache')
options=('staticlibs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/dvidelabs/flatcc/archive/v${pkgver}.tar.gz")
sha256sums=('d7519a97569ebdc9d12b162be0f9861fdc2724244f68595264a411ac48e4e983')

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
