# Maintainer: René Wagner < rwagner at rw-net dot de >

pkgname=mimalloc
pkgver=1.6.1
pkgrel=3
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
license=('MIT')
url='https://github.com/microsoft/mimalloc'
conflicts=('mimalloc-git')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('mimalloc')
options=('staticlibs')
source=("${pkgname}_${pkgver}::git+https://github.com/microsoft/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}_${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${pkgname}_${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
