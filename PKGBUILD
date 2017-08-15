# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calculator
pkgver=0.1.3
pkgrel=1
pkgdesc='The Pantheon Calculator'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-calculator'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'intltool' 'vala')
source=("https://launchpad.net/pantheon-calculator/0.4-loki/${pkgver}/+download/pantheon-calculator-${pkgver}.tar.xz")
sha256sums=('6fbc43aa5ff550224ec8bb39a8772cc3457eca42b84d4c33d1fe9823c7c000b0')

prepare() {
  cd pantheon-calculator-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-calculator-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd pantheon-calculator-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
