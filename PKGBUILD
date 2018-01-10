# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-plugin-sasl-git
pkgver=r42.671022f
pkgrel=1
pkgdesc='SASL plugin for gSSO'
arch=('x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('gsasl' 'gsignond')
makedepends=('check' 'git' 'gobject-introspection' 'gtk-doc' 'meson')
provides=('gsignond-plugin-sasl')
conflicts=('gsignond-plugin-sasl')
source=('git+https://gitlab.com/accounts-sso/gsignond-plugin-sasl.git')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-plugin-sasl

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
#  cd gsignond-plugin-sasl

# mkdir -p m4
# gtkdocize
# aclocal
# autoheader
# libtoolize --copy --force
# autoconf
# automake --add-missing --copy
# autoreconf --install --force

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../gsignond-plugin-sasl
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
