# Maintainer

pkgname=lib32-libbpf
pkgver=1.7.0
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=(x86_64)
license=('LGPL-2.1-only OR BSD-2-Clause')
depends=(
  lib32-glibc
  lib32-libelf
  lib32-zlib
  libbpf
)
makedepends=(
  git
)
provides=(libbpf.so)
source=("git+${url}#tag=v${pkgver}")
sha512sums=('f623f39bec882c8a642bf8f1485d3ca028b393b73b1bb588be26b9b7f58040223b6ca778a098c2c7468cf60386cbc279d58c7f2c83836bf0fcebb87a69aa86f9')
b2sums=('1315f3cdd336b57a70e2b0284d1f5a6ad32d1e3aabcca6fdccd50d51aa743f365c396ac240995e36d92f37f2d8bc0afb487e59a47638d0ae1f7999cc03cf0f5b')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cd libbpf
  make -C src
}

package() {
  cd libbpf
  make -C src DESTDIR="${pkgdir}" LIBSUBDIR=lib32 install
  rm -r "${pkgdir}/usr/include"
  install -Dm 644 LICENSE.BSD-2-Clause -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
