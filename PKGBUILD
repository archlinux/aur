# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-libteam
pkgver=1.11
pkgrel=1
pkgdesc='Library for controlling team network device'
arch=('x86_64')
url='http://libteam.org/'
license=('LGPL2.1')
depends=('lib32-jansson' 'lib32-libdaemon' 'lib32-libdbus' 'lib32-libnl'
         'libteam')
makedepends=('gcc-multilib' 'swig')
source=("http://libteam.org/files/libteam-${pkgver}.tar.gz")
sha256sums=('b89e81258f8a8f4abd718ec1c91f85cb66d4d29e4d50095a3d2a4ffd8ce4bf7a')

build() {
  cd libteam-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --disable-static
    make
}

package() {
  cd libteam-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}

# vim: ts=2 sw=2 et:
