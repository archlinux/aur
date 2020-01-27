# Maintainer: Germán Franco <dev.germanfr@gmail.com>

pkgname=elementary-blue-icon-theme-git
pkgver=r2262.6aa716cc
pkgrel=1
pkgdesc='Classic blue folders of the elementary icon theme.'
arch=('any')
url='https://github.com/germanfr/elementary-blue-icons'
license=('GPL3')
groups=('pantheon-unstable')
depends=('elementary-icon-theme')
makedepends=('git' 'meson')
options=('!emptydirs')
source=('elementary-blue-icon-theme::git+https://github.com/germanfr/elementary-blue-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd elementary-blue-icon-theme
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

  arch-meson ../elementary-blue-icon-theme
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:

