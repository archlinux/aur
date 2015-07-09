# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Maximilian Stein <theoddbird@posteo.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libsoup
pkgver=2.50.0
pkgrel=1
pkgdesc='GNOME HTTP Library'
arch=('x86_64')
url='http://www.gnome.org'
license=('LGPL')
depends=('lib32-glib-networking' 'lib32-libxml2' 'lib32-sqlite' 'libsoup')
makedepends=('gcc-multilib' 'gobject-introspection' 'intltool' 'python'
             'python')
conflicts=('lib32-libsoup-gnome')
replaces=('lib32-libsoup-gnome')
options=('!emptydirs')
source=("http://ftp.gnome.org/pub/gnome/sources/libsoup/${pkgver%.*}/libsoup-${pkgver}.tar.xz")
sha256sums=('1e01365ac4af3817187ea847f9d3588c27eee01fc519a5a7cb212bb78b0f667b')

build() {
  cd libsoup-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static
  make
}

package() {
  cd libsoup-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et:
