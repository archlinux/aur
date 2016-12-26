# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=firebird-nspire-git
pkgver=r708.c771637
pkgrel=1
pkgdesc='Community emulator of TI-Nspire calculators.'
arch=('i686' 'x86_64')
url='https://github.com/nspire-emus/firebird'
conflicts=('nspire_emu' 'firebird-nspire')
provides=('firebird-nspire')
license=('GPL')
depends=()
makedepends=('qt5-declarative' 'git')
source=("${pkgname%-git}"::'git+https://github.com/nspire-emus/firebird')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
