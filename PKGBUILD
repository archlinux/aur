# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-libepoxy
pkgver=1.2
pkgrel=2
pkgdesc='A library for handling OpenGL function pointer management for you'
arch=('i686' 'x86_64')
url='https://github.com/anholt/libepoxy'
license=('MIT')
depends=('lib32-glibc')
makedepends=('lib32-libgl' 'python' 'xorg-util-macros')
source=("libepoxy-${pkgver}.tar.gz::https://github.com/anholt/libepoxy/archive/v${pkgver}.tar.gz")
sha256sums=('42c328440f60a5795835c5ec4bdfc1329e75bba16b6e22b3a87ed17e9679e8f6')

build() {
  cd libepoxy-${pkgver}

  export CC='gcc -m32'
  export CXX='/bin/false'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./autogen.sh \
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
