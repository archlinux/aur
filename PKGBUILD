# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-glib-networking
pkgver=2.48.1
pkgrel=1
pkgdesc='Network-related giomodules for glib'
arch=('x86_64')
url='http://www.gtk.org/'
license=('GPL2')
depends=('glib-networking' 'lib32-glib2' 'lib32-gnutls' 'lib32-libproxy')
makedepends=('ca-certificates' 'gcc-multilib' 'intltool')
install='glib-networking.install'
source=("http://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz")
sha256sums=('cf9923ab9860011c5af6d58b0aa1db693d353f2008014a3dcb07af1952bea44a')

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
