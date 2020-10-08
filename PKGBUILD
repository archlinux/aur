# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=firebird-nspire-git
pkgver=1.5.r31.g6fc3858
pkgrel=1
pkgdesc='Community emulator of TI-Nspire calculators.'
arch=('i686' 'x86_64')
url='https://github.com/nspire-emus/firebird'
conflicts=('nspire_emu' 'firebird-nspire')
provides=('firebird-nspire')
license=('GPL3')
depends=('qt5-quickcontrols')
makedepends=('qt5-declarative' 'git')
source=("${pkgname%-git}"::'git+https://github.com/nspire-emus/firebird')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule init
  git submodule update
}

build() {
  # Compile...
  cd "${srcdir}/${pkgname%-git}"
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  # Install...
  cd "${srcdir}/${pkgname%-git}/build"
  INSTALL_ROOT="${pkgdir}" make install
}
