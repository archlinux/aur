# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-icon-theme-git
pkgver=r2159.22235cb7
pkgrel=1
pkgdesc='Named, vector icons for elementary OS'
arch=('any')
url='https://github.com/elementary/icons'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
provides=('elementary-icon-theme')
conflicts=('elementary-icon-theme')
options=('!emptydirs')
source=('elementary-icon-theme::git+https://github.com/elementary/icons.git')
sha256sums=('SKIP')

pkgver() {
  cd elementary-icon-theme

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

package() {
  cd build

  cmake ../elementary-icon-theme \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:

