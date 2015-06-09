# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-plugin-oauth-git
pkgver=r76.cb0dfc1
pkgrel=1
pkgdesc='OAuth plugin for gSSO'
arch=('i686' 'x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('gsignond' 'json-glib' 'libsoup')
makedepends=('git' 'gobject-introspection' 'gtk-doc')
provides=('gsignond-plugin-oauth')
conflicts=('gsignond-plugin-oauth')
source=('gsignond-plugin-oauth::git+https://gitlab.com/accounts-sso/gsignond-plugin-oa.git')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-plugin-oauth

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd gsignond-plugin-oauth

  mkdir -p m4
  gtkdocize
  aclocal
  autoheader
  libtoolize --copy --force
  autoconf
  automake --add-missing --copy
}

build() {
  cd gsignond-plugin-oauth

  ./configure \
    --prefix='/usr' \
    --enable-gtk-doc
  make
}

package() {
  cd gsignond-plugin-oauth

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
