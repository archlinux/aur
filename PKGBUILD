# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-plugin-oauth-git
pkgver=r106.b36060b
pkgrel=1
pkgdesc='OAuth plugin for gSSO'
arch=('x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('glib2' 'glibc' 'gnutls' 'gsignond' 'json-glib' 'libsoup' 'sqlite')
makedepends=('check' 'git' 'gobject-introspection' 'gtk-doc' 'meson')
provides=('gsignond-plugin-oauth')
conflicts=('gsignond-plugin-oauth')
source=('gsignond-plugin-oauth::git+https://gitlab.com/accounts-sso/gsignond-plugin-oa.git')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-plugin-oauth

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  #export CFLAGS="$CFLAGS -Wno-deprecated-declarations"

  arch-meson ../gsignond-plugin-oauth
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
