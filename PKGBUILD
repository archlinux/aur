# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=sound-theme-elementary-git
pkgver=r217.bc242d1
pkgrel=1
pkgdesc='A bespoke sound for your theme'
arch=('x86_64')
url='https://github.com/elementary/sound-theme'
license=('GPL3')
groups=('pantheon-unstable')
makedepends=('git' 'meson')
provides=('sound-theme-elementary')
conflicts=('sound-theme-elementary')
source=('git+https://github.com/elementary/sound-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd sound-theme-elementary

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

  arch-meson ../sound-theme-elementary
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
