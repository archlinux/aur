# Maintainer: jabra98 <jabra98.gpg@gmail.com>
pkgname='rwth-psp-libc'
groups=('rwth-psp-toolchain')
pkgver=2.0.0
pkgrel=1
pkgdesc="Toolchain (libc) for the RWTH psp module"
arch=('x86_64')
url="https://www.nongnu.org/avr-libc"
license=('GPL3')
conflicts=()
makedepends=('gcc10')
depends=('rwth-psp-binutils' 'rwth-psp-gcc')
provides=("${pkgname}")
source=("avr-libc-${pkgver}.tar.bz2::http://download.savannah.gnu.org/releases/avr-libc/avr-libc-${pkgver}.tar.bz2")
sha256sums=("b2dd7fd2eefd8d8646ef6a325f6f0665537e2f604ed02828ced748d49dc85b97")

_prefix="/opt/psp-toolchain"

prepare() {
  cd "${srcdir}/avr-libc-${pkgver}"
  ./bootstrap
}

build() {
  export PATH="${_prefix}/bin:$PATH"

  # build libc
  cd "${srcdir}/avr-libc-${pkgver}"
  ./configure --prefix=${_prefix} --build=`./config.guess` --host=avr
  make
}

package() {
  cd "${srcdir}/avr-libc-${pkgver}"
  make DESTDIR="$pkgdir/" install 
}
