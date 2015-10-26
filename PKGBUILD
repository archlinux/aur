# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-glib-networking
pkgver=2.46.1
pkgrel=1
pkgdesc='Network-related giomodules for glib'
arch=('x86_64')
url='http://www.gtk.org/'
license=('GPL2')
depends=('glib-networking' 'lib32-glib2' 'lib32-gnutls' 'lib32-libproxy')
makedepends=('ca-certificates' 'gcc-multilib' 'intltool')
install='glib-networking.install'
source=("http://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz")
sha256sums=('d5034214217f705891b6c9e719cc2c583c870bfcfdc454ebbb5e5e8940ac90b1')

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
  rm -rf "${pkgdir}"/usr/share
}

# vim: ts=2 sw=2 et:
