# Maintainer

pkgname=lib32-libbpf
pkgver=1.5.1
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
sha512sums=('2b4087d1c84985630c96fce807146cb699676069d55a5f57781f9fbef6135513df5d055a8286f86fd3de03cccd85450924748c52f4cb5868c5a158d99bb8bf2a')
b2sums=('4d62738d8097a7d9be34fcbf2d546621cfb11d28db79e313fcbf7885e3e16a5f76357840cc1b072cc76d184090e6f4d7ca92d144ce5e172af875450a8f09dac5')

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
