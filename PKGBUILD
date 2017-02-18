# Contributor: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
# Contributor: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=firebird-nspire
pkgver=1.2
pkgrel=1
pkgdesc='Community emulator of TI-Nspire calculators.'
arch=('i686' 'x86_64')
url='https://github.com/nspire-emus/firebird'
conflicts=('nspire_emu')
license=('GPL3')
depends=()
makedepends=('qt5-declarative>=5.6' 'git')
source=("${pkgname}"::'git+https://github.com/nspire-emus/firebird')
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout -b "v${pkgver}" "v${pkgver}"
  git submodule init
  git submodule update
}

build() {
  # Compile...
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  # Install...
  cd "${srcdir}/${pkgname}/build"
  INSTALL_ROOT="${pkgdir}" make install
}

