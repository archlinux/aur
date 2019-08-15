# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
pkgname=bpftrace
pkgver=0.9.2
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
sha512sums=('5c6ee5fec690a907c370ed0bed85906d304215d7f97b99a2cae90453061f522fa6369627c9524a5a24e97c6cbb595a880a2a1b1d71095fffb693a4cef172a6f0')

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
