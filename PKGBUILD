# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
pkgname=bpftrace
pkgver=0.10.0
pkgrel=3
pkgdesc='High-level tracing language for Linux eBPF'
arch=('i686' 'x86_64')
url='https://github.com/iovisor/bpftrace'
license=('Apache')
depends=('libelf' 'zlib' 'llvm-libs' 'clang' 'bcc')
makedepends=('cmake' 'llvm' 'git')
optdepends=('libbpf>=0.0.5: BTF support - required at compile time')
conflicts=('bpftrace-git')
provides=('bpftrace')
source=("https://github.com/iovisor/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/iovisor/bpftrace/pull/1391.patch")
sha512sums=('da400efe78cea505a32deead594b047ec4394d3eefe86e7b6853fe2dc715c5847a3abcbd26c1fac39d0a534f1e57d6c0bc3625e0c3f1054b0d84b7b1d6eb69b9'
            'db9239371726d96d642d252c2972241a53e894a0d5ee217b0e5f5b07c92bde06a35ac11df26e31afba9d1846c4da1c1e09be992c0e7de39f43700f625ad6e579')
options=('!strip')

prepare() {
  patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}"/1391.patch
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
