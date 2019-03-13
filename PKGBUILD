# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
pkgname=bpftrace
pkgver=0.8
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
sha512sums=('7428c2bdcfb60d30f933d0b27fd49512a227f989b20edf2f8f86368eb5ddc89a7e58c671731858795f83efcc843c8830596843672e8690c54d35ec79218f4439')

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
