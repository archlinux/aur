# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor : josephgbr <rafael.f.f1 at gmail.com>
# Contributor : angvp <angvp at archlinux.org>

pkgname=lib32-libaio
pkgver=0.3.109
pkgrel=6
pkgdesc='The Linux-native asynchronous I/O facility (aio) library'
arch=('x86_64')
url='http://lse.sourceforge.net/io/aio.html'
license=('LGPL')
depends=("${pkgname#*-}")
makedepends=('gcc-multilib')
options=('!staticlibs')
source=("http://ftp.de.debian.org/debian/pool/main/liba/${pkgname#*-}/${pkgname#*-}_${pkgver}.orig.tar.gz")
sha256sums=('bf4a457253cbaab215aea75cb6e18dc8d95bbd507e9920661ff9bdd288c8778d')

build() {
  cd ${pkgname#*-}-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  make
}

package() {
  cd ${pkgname#*-}-${pkgver}

  make prefix="${pkgdir}"/usr libdir="${pkgdir}"/usr/lib32 install
  rm -rf "${pkgdir}"/usr/include
}

# vim: ts=2 sw=2 et:
