# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calculator
pkgver=0.1.1
pkgrel=1
pkgdesc='The Pantheon Calculator'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-calculator'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'vala')
source=("https://launchpad.net/pantheon-calculator/0.4-loki/${pkgver}/+download/pantheon-calculator-${pkgver}.tar.xz")
sha256sums=('7278300642872e296eb558e656ee4a838f10ca3664cbec7d63e689a8b96e0625')

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
