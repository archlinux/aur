# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>

# based on picsim PKGBUILD by:
# Maintainer : yjun <jerrysteve1101 at gmail dot com>
# Contributor : Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsim-git
_basename=picsim
pkgver=r215.d4aa357
pkgrel=1
pkgdesc="Emulates some PIC microcontroller and periferics such as USART and timers, the simulator architecture permit easy implementation of external elements in C"
arch=('x86_64')
url='https://github.com/lcgamboa/picsim'
license=('GPL2')
options=('staticlibs')
depends=('glibc')
makedepends=('gcc'
             'doxygen'
             'git')
source=("git+https://github.com/lcgamboa/picsim/")
sha256sums=('SKIP')
provides=('picsim')
conflicts=('picsim')

pkgver() {
  cd "${_basename}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_basename}"

  make
}

package() {
  cd "${_basename}"
  
  install -dm755 "$pkgdir/usr/lib"

  # install
  make install prefix="$pkgdir/usr" 

  # bin
  install -Dm755 src/${_basename} -t "${pkgdir}/usr/bin"

  # doc
  install -d "${pkgdir}/usr/share/doc/${_basename}"
  cp -avR docs examples \
  	"${pkgdir}/usr/share/doc/${_basename}"
}
