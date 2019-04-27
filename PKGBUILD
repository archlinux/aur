# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: angvp <angvp@archlinux.org>

pkgname=lib32-libaio
pkgver=0.3.112
pkgrel=1
pkgdesc='The Linux-native asynchronous I/O facility (aio) library'
arch=('x86_64')
url='http://lse.sourceforge.net/io/aio.html'
license=('LGPL')
depends=('libaio')
source=("https://ftp.de.debian.org/debian/pool/main/liba/libaio/libaio_${pkgver}.orig.tar.xz")
sha256sums=('f69e5800425f4ea957426693ac09f9896bb993db5490fa021644454adcc72a32')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  # AIO library is a thin wrapper around kernel syscalls, it does not use stdlib
  # and other helpers like stack protection libraries
  export CFLAGS='-march=x86-64 -mtune=generic -O2 -pipe -fno-stack-protector -fno-plt'

  make -C libaio-${pkgver}
}

package() {
  make -C libaio-${pkgver} prefix="${pkgdir}"/usr libdir="${pkgdir}"/usr/lib32 install
  rm -rf "${pkgdir}"/usr/include
}

# vim: ts=2 sw=2 et:
