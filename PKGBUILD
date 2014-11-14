# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor : josephgbr <rafael.f.f1@gmail.com>
# Contributor : angvp <angvp@archlinux.org>

pkgname=lib32-libaio
pkgver=0.3.110
pkgrel=1
pkgdesc='The Linux-native asynchronous I/O facility (aio) library'
arch=('x86_64')
url='http://lse.sourceforge.net/io/aio.html'
license=('LGPL')
depends=("libaio=${pkgver}")
makedepends=('gcc-multilib')
source=("http://ftp.de.debian.org/debian/pool/main/liba/libaio/libaio_${pkgver}.orig.tar.gz")
sha256sums=('e019028e631725729376250e32b473012f7cb68e1f7275bfc1bbcdd0f8745f7e')

build() {
  cd libaio-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export CFLAGS='-march=x86-64 -mtune=generic -O2 -pipe'
  make
}

package() {
  cd libaio-${pkgver}

  make prefix="${pkgdir}"/usr libdir="${pkgdir}"/usr/lib32 install
  rm -rf "${pkgdir}"/usr/include
}

# vim: ts=2 sw=2 et:
