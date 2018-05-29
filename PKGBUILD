# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-glib-networking
pkgver=2.56.1
pkgrel=1
pkgdesc='Network-related giomodules for glib'
arch=('x86_64')
url='https://git.gnome.org/browse/glib-networking/'
license=('GPL2')
depends=('glib-networking' 'lib32-glib2' 'lib32-gnutls' 'lib32-libproxy')
makedepends=('ca-certificates' 'gcc-multilib' 'intltool' 'meson')
source=("http://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz")
sha256sums=('df47b0e0a037d2dcf6b1846cbdf68dd4b3cc055e026bb40c4a55f19f29f635c8')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson glib-networking-${pkgver} build \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32/glib-networking'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf "${pkgdir}"/usr/{lib,share}
}

# vim: ts=2 sw=2 et:
