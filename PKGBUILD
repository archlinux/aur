# Maintainer: Daniel McLarty <info@savagedevs.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
# Contributor: Haruue Icymoon <haruue@caoyue.com.cn>
# Contributor: Oskar Sveinsen
# Contributor: PolyWolf <p0lyw0lf@protonmail.com>
# Contributor: j.r <j.r@jugendhacker.de>

pkgname=firebird-nspire
pkgver=1.6
pkgrel=1
pkgdesc='Third-party multi-platform emulator of the ARM-based TI-Nspire™ calculators'
arch=('i686' 'x86_64')
url='https://github.com/nspire-emus/firebird'
license=('GPL3')
depends=('qt5-quickcontrols')
makedepends=('qt5-declarative>=5.6' 'git')
source=(${pkgname}::git+https://github.com/nspire-emus/firebird.git#tag=v${pkgver})
sha256sums=('SKIP')


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
