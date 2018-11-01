# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic@gmail.com>

pkgname=gsignond
pkgver=1.2.0
pkgrel=1
pkgdesc='gSSO glib daemon'
arch=('x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('glib2' 'glibc' 'sqlite')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
provides=('libgsignond-common.so')
backup=('etc/gsignond.conf')
source=("git+https://gitlab.com/accounts-sso/gsignond.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd gsignond

  git cherry-pick -n 39022c86ddb5062a10fb0503ad9d81a8e532d527
}

build() {
  arch-meson gsignond build \
    -D documentation='false'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
