# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=nfstrace
pkgver=0.4.3.2
pkgrel=1
pkgdesc="NFS and CIFS tracing/monitoring/capturing/analyzing tool"
url="https://github.com/epam/nfstrace/"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('cmake' 'libpcap' 'json-c' 'ncurses')

source=("$pkgname"-"$pkgver".tar.gz::https://github.com/epam/nfstrace/archive/"$pkgver".tar.gz)

sha256sums=('dc57d946454d5b847e640818c912208b84bb28c03b757ba97a37bf481dba46a0')

build() {
  # make sure repetitive builds are clean
  [[ -d "${srcdir}/${pkgbase}-${pkgver}/release" ]] && \
    rm -rf "${srcdir}/${pkgbase}-${pkgver}/release"
  mkdir "${srcdir}/${pkgbase}-${pkgver}/release"
  cd "${srcdir}/${pkgbase}-${pkgver}/release"

  # Use this line instead if you want clang/llvm instead of gcc:
  #  CC="clang" CXX="clang++" cmake ../ \
  cmake ../ \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}/release"
  make DESTDIR="${pkgdir}/" install
}
