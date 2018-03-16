# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-libteam
pkgver=1.27
pkgrel=1
pkgdesc='Library for controlling team network device'
arch=('x86_64')
url='http://libteam.org/'
license=('LGPL2.1')
depends=('lib32-dbus' 'lib32-libnl' 'lib32-zeromq' 'libteam')
makedepends=('gcc-multilib' 'lib32-jansson' 'lib32-libdaemon' 'swig')
source=("http://libteam.org/files/libteam-${pkgver}.tar.gz")
sha256sums=('e74f8f5bba0511c7e971836794be7d88df4644e398dfb706c7679850cd44cdff')

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
