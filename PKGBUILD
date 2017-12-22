# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-print-git
pkgver=r18.b526ae8
pkgrel=1
pkgdesc=' Simple shim for printing support via Contractor'
arch=('x86_64')
url='https://github.com/elementary/pantheon-print'
license=('GPL3')
depends=('cairo' 'contractor-git' 'glib2' 'glibc' 'gtk3' 'pango')
makedepends=('cmake' 'git' 'vala')
provides=('pantheon-print')
conflicts=('pantheon-print')
replaces=('pantheon-print-bzr')
source=('git+https://github.com/elementary/pantheon-print.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-print

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-print

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-print/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd pantheon-print/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
