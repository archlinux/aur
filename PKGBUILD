# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-libteam
pkgver=1.26
pkgrel=1
pkgdesc='Library for controlling team network device'
arch=('x86_64')
url='http://libteam.org/'
license=('LGPL2.1')
depends=('lib32-dbus' 'lib32-libnl' 'lib32-zeromq' 'libteam')
makedepends=('gcc-multilib' 'lib32-jansson' 'lib32-libdaemon' 'swig')
source=("http://libteam.org/files/libteam-${pkgver}.tar.gz")
sha256sums=('0ad5eae9e1a7835e784c5e21e8df323ca29ccc3ab8a8187fdc9ff3f6765c9b34')

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
