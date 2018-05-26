# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic@gmail.com>

pkgname=gsignond
pkgver=1.0.7
pkgrel=1
pkgdesc='gSSO glib daemon'
arch=('x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('glib2' 'glibc' 'sqlite')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'meson' 'vala')
provides=('libgsignond-common.so')
backup=('etc/gsignond.conf')
source=("git+https://gitlab.com/accounts-sso/gsignond.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../gsignond
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
