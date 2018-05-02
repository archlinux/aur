# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: angvp <angvp@archlinux.org>

pkgname=lib32-libaio
pkgver=0.3.111
pkgrel=1
pkgdesc='The Linux-native asynchronous I/O facility (aio) library'
arch=('x86_64')
url='http://lse.sourceforge.net/io/aio.html'
license=('LGPL')
depends=('libaio')
source=("http://ftp.de.debian.org/debian/pool/main/liba/libaio/libaio_${pkgver}.orig.tar.gz")
sha256sums=('62cf871ad8fd09eb3418f00aca7a7d449299b8e1de31c65f28bf6a2ef1fa502a')

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
