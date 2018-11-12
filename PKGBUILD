# Maintainer: Que Quotion <quequotion@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-plugin-mail-git
pkgver=r10.3a9503d
pkgrel=1
pkgdesc='Mail plugin for gSSO'
arch=('x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('glib2' 'glibc'
         'libgsignond-common.so')
makedepends=('git' 'gobject-introspection' 'gsignond' 'gtk-doc' 'meson' 'vala')
provides=('gsignond-plugin-mail')
conflicts=('gsignond-plugin-mail')
source=('gsignond-plugin-mail::git+https://gitlab.com/accounts-sso/gsignond-plugin-mail.git')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-plugin-mail

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

  arch-meson ../gsignond-plugin-mail
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}
