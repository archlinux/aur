# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libgusb
pkgver=0.2.7
pkgrel=1
pkgdesc='GLib wrapper around libusb1'
arch=('x86_64')
url='https://gitorious.org/gusb/'
license=('LGPL2.1')
depends=('lib32-glib2' 'lib32-libusb' 'libgusb')
makedepends=('gcc-multilib' 'gobject-introspection' 'python2')
source=("http://people.freedesktop.org/~hughsient/releases/libgusb-${pkgver}.tar.xz")
sha256sums=('0be9578f7875cecb6c163ad47eb39bc6bf497e501b08986c0d384748a054c3ee')

build() {
  cd libgusb-${pkgver}

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
  cd libgusb-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et:
