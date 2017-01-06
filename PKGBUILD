# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-glib-networking
pkgver=2.50.0
pkgrel=1
pkgdesc='Network-related giomodules for glib'
arch=('x86_64')
url='https://git.gnome.org/browse/glib-networking/'
license=('GPL2')
depends=('glib-networking' 'lib32-glib2' 'lib32-gnutls' 'lib32-libproxy')
makedepends=('ca-certificates' 'gcc-multilib' 'intltool')
source=("http://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz")
sha256sums=('3f1a442f3c2a734946983532ce59ed49120319fdb10c938447c373d5e5286bee')

build() {
  cd glib-networking-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32/glib-networking' \
    --sysconfdir='/etc' \
    --disable-installed-tests \
    --disable-static
  make
}

package() {
  cd glib-networking-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{lib,share}
}

# vim: ts=2 sw=2 et:
