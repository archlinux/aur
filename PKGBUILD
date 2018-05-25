# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-print-git
pkgver=r26.28f2600
pkgrel=1
pkgdesc='Simple shim for printing support via Contractor'
arch=('x86_64')
url='https://github.com/elementary/pantheon-print'
license=('GPL3')
depends=('cairo' 'contractor-git' 'glib2' 'glibc' 'gtk3' 'pango')
makedepends=('git' 'meson' 'vala')
provides=('pantheon-print')
conflicts=('pantheon-print')
source=('git+https://github.com/elementary/pantheon-print.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-print

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

  arch-meson ../pantheon-print
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
