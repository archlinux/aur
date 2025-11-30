# Maintainer

pkgname=lib32-libbpf
pkgver=1.6.2
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
sha512sums=('7007ec4239f1ccc11c803dcdd834e97fe00e2528db0c17b4500d854957924ccd2d437ee7a00c76f2aacb336f3b001414fa66d6de0d0d3fc7c5d0896eb289b05a')
b2sums=('3dfa86acf5f4cae1079a90bfc28100878fcc74ba70180ad469f702dca09d0c32d83344708722640af46fb7b45980542d1501c6ef9123d2eaea2aef8db9811a5e')

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
