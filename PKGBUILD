# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-libteam
pkgver=1.23
pkgrel=1
pkgdesc='Library for controlling team network device'
arch=('x86_64')
url='http://libteam.org/'
license=('LGPL2.1')
depends=('lib32-libdbus' 'lib32-libnl' 'lib32-zeromq' 'libteam')
makedepends=('gcc-multilib' 'lib32-jansson' 'lib32-libdaemon' 'swig')
source=("http://libteam.org/files/libteam-${pkgver}.tar.gz")
sha256sums=('d8cd132c425032cc3a7e9314c55485e32243875e0b1adbddd043bbadf1d28c5a')

build() {
  cd libteam-${pkgver}

  export CC='gcc -m32'
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
