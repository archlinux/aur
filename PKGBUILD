# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
pkgname=bpftrace
pkgver=0.9.1
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
sha512sums=('e813c598b3acb85d94e1cb02f75b5fa849f10ee1cc39fb73e843a797946d7642463bcc3d083ff377d68b9e2a1aabb56995ab4ebe2be822f4f393448c7f02ca4b')

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
