# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-libepoxy
pkgver=1.3.1
pkgrel=2
pkgdesc='A library for handling OpenGL function pointer management for you'
arch=('i686' 'x86_64')
url='https://github.com/anholt/libepoxy'
license=('MIT')
depends=('lib32-glibc')
makedepends=('gcc-multilib' 'lib32-libgl' 'python' 'xorg-util-macros')
source=("https://github.com/anholt/libepoxy/releases/download/v${pkgver}/libepoxy-${pkgver}.tar.bz2")
sha256sums=('1d8668b0a259c709899e1c4bab62d756d9002d546ce4f59c9665e2fc5f001a64')

build() {
  cd libepoxy-${pkgver}

  export CC='gcc -m32'
  export CXX='/bin/false'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
}

package() {
  cd libepoxy-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libepoxy "${pkgdir}"/usr/share/licenses/lib32-libepoxy
}

# vim: ts=2 sw=2 et:
