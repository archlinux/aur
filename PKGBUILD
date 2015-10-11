# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=0.113
pkgrel=2
pkgdesc='Application development toolkit for controlling system-wide privileges'
arch=('x86_64')
license=('LGPL')
url='http://www.freedesktop.org/wiki/Software/polkit'
depends=('lib32-glib2' 'lib32-js17' 'lib32-pam' 'lib32-systemd' 'polkit')
makedepends=('gcc-multilib' 'intltool' 'python2')
source=("http://www.freedesktop.org/software/polkit/releases/polkit-${pkgver}.tar.gz")
sha256sums=('e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81')

build() {
  cd polkit-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32/polkit-1' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --enable-libsystemd-login \
    --disable-examples \
    --disable-gtk-doc-html \
    --disable-introspection \
    --disable-man-pages \
    --disable-static \
    --with-os-type='redhat'
  make
}

package() {
  cd polkit-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,lib,include,share}}
}

# vim: ts=2 sw=2 et:
