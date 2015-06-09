# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-plugin-sasl-git
pkgver=r29.55f1e28
pkgrel=1
pkgdesc='SASL plugin for gSSO'
arch=('i686' 'x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('gsasl' 'gsignond')
makedepends=('git' 'gobject-introspection' 'gtk-doc')
provides=('gsignond-plugin-sasl')
conflicts=('gsignond-plugin-sasl')
source=('git+https://gitlab.com/accounts-sso/gsignond-plugin-sasl.git')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-plugin-sasl

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd gsignond-plugin-sasl

  mkdir -p m4
  gtkdocize
  aclocal
  autoheader
  libtoolize --copy --force
  autoconf
  automake --add-missing --copy
  autoreconf --install --force
}

build() {
  cd gsignond-plugin-sasl

  ./configure \
    --prefix='/usr' \
    --enable-gtk-doc
  make
}

package() {
  cd gsignond-plugin-sasl

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
