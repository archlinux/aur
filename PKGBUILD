# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
# Contributor: Haruue Icymoon <haruue@caoyue.com.cn>
# Contributor: Oskar Sveinsen

pkgname=firebird-nspire
pkgver=1.4
pkgrel=1
pkgdesc='Community emulator of TI-Nspire calculators'
arch=('i686' 'x86_64')
url='https://github.com/nspire-emus/firebird'
conflicts=('nspire_emu')
license=('GPL3')
depends=('qt5-quickcontrols')
makedepends=('qt5-declarative>=5.6' 'git')
source=(${pkgname}::git+https://github.com/nspire-emus/firebird.git#tag=v${pkgver})
md5sums=('SKIP')


prepare() {
  cd "${pkgname}"
  git submodule init
  git submodule update
}

build() {
  cd "${pkgname}"
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  cd "${pkgname}/build"
  INSTALL_ROOT="${pkgdir}" make install
}
