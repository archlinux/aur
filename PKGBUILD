# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-plugin-lastfm-git
pkgver=r3.0a7a5f8
pkgrel=1
pkgdesc='LastFM plugin for gSSO'
arch=('x86_64')
url='https://gitlab.com/accounts-sso/gsignond-plugin-lastfm'
license=('GPL3')
depends=('gsignond' 'json-glib' 'libsoup')
makedepends=('git' 'meson' 'vala')
provides=('gsignond-plugin-lastfm')
conflicts=('gsignond-plugin-lastfm')
source=('git+https://gitlab.com/accounts-sso/gsignond-plugin-lastfm.git')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-plugin-lastfm

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  arch-meson gsignond-plugin-lastfm build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
