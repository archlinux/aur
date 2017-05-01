# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calculator-git
pkgver=r382.530438d
pkgrel=1
pkgdesc='The Pantheon Calculator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/calculator'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so')
makedepends=('cmake' 'git' 'granite-git' 'intltool' 'vala')
provides=('pantheon-calculator')
conflicts=('pantheon-calculator')
replaces=('pantheon-calculator-bzr')
source=('pantheon-calculator::git+https://github.com/elementary/calculator.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-calculator

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-calculator

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-calculator/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd pantheon-calculator/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
