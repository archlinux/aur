# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict@gmail.com>
# Contributor: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: Celti <celticmadman@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-smpeg
pkgver=0.4.5
pkgrel=3
pkgdesc='SDL MPEG Player Library'
arch=('x86_64')
url='http://icculus.org/smpeg/'
license=('LGPL')
depends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-sdl' 'smpeg')
makedepends=('gcc-multilib' 'lib32-glu' 'lib32-mesa' 'subversion')
source=("smpeg::svn://svn.icculus.org/smpeg/tags/release_${pkgver//./_}")
sha256sums=('SKIP')

build() {
  cd smpeg

  export CC='gcc -m32'
  export CXX='g++ -m32 -std=gnu++03'
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static
  make
}

package() {
  cd smpeg

  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/"{bin,include,share}
}

# vim: ts=2 sw=2 et:
