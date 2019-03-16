# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
pkgname=bpftrace
pkgver=0.9
pkgrel=1
pkgdesc='High-level tracing language for Linux eBPF'
arch=('i686' 'x86_64')
url="https://github.com/iovisor/bpftrace"
license=('Apache')
depends=('libelf' 'zlib' 'llvm-libs' 'clang')
makedepends=('cmake' 'llvm' 'bcc')
conflicts=('bpftrace-git')
provides=('bpftrace')
source=("https://github.com/iovisor/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('771c412a6b1ee7a7d5bba9e0910633056c6f5523e5d1efd9d7ccb5b9f9b462b7bda8d170c5ed0653f3c1bfd5cc77fce2fd552f12eb8222a8747620b3dc9b49f8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
