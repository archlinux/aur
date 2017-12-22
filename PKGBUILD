# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=cerbere-git
pkgver=r107.c11a2af
pkgrel=1
pkgdesc='The Pantheon Watchdog'
arch=('x86_64')
url='https://github.com/elementary/cerbere'
license=('GPL2')
groups=('pantheon-unstable')
depends=('dconf' 'glib2' 'glibc' 'libgee')
makedepends=('cmake' 'git' 'vala')
provides=('cerbere')
conflicts=('cerbere')
replaces=('cerbere-bzr')
source=('git+https://github.com/elementary/cerbere.git')
sha256sums=('SKIP')

pkgver() {
  cd cerbere

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd cerbere

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd cerbere/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd cerbere/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
