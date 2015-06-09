# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-libqmi
pkgver=1.12.0
pkgrel=1
pkgdesc='QMI modem protocol helper library'
arch=('x86_64')
url='http://www.freedesktop.org/wiki/Software/libqmi/'
license=('GPL2')
depends=('lib32-glib2' 'libqmi')
makedepends=('gcc-multilib' 'python')
source=("http://www.freedesktop.org/software/libqmi/libqmi-${pkgver}.tar.xz")
sha256sums=('7bf0a5b70a6e8214932ec32c264e59d5290c6bd181fa1341c028a063181f64ff')

build() {
  cd libqmi-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --disable-gtk-doc-html \
    --disable-static \
    --without-python
  make
}

package() {
  cd libqmi-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
