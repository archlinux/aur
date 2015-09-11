# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calculator
pkgver=0.1.0.1
pkgrel=2
pkgdesc='The Pantheon Calculator'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-calculator'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'vala')
install='pantheon-calculator.install'
#source=("https://launchpad.net/pantheon-calculator/freya/${pkgver}/+download/pantheon-calculator-${pkgver}.tgz")
#sha256sums=('510235d87284eaa211089970601c71d1cc4aa2aadaa6304a163a2db8d9e1fcd0')
source=("bzr+lp:pantheon-calculator#revision=140")
sha256sums=('SKIP')

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
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd pantheon-calculator/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
