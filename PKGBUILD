# Maintainer : yjun <jerrysteve1101 at gmail dot com>
# Contributor : Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsim
pkgver=0.9.0
pkgrel=1
pkgdesc="Emulates some PIC microcontroller and periferics such as USART and timers, the simulator architecture permit easy implementation of external elements in C"
arch=('x86_64')
url='https://github.com/lcgamboa/picsim'
license=('GPL2')
options=('staticlibs')
depends=('glibc')
makedepends=('gcc'
             'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lcgamboa/picsim/archive/v${pkgver}.tar.gz")
sha256sums=('706b7ac81d54516d6161c84394ddc78063036cbf09271f026446f1ba87bf14b4')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"
  
  install -dm755 "$pkgdir/usr/lib"

  # install
  make install prefix="$pkgdir/usr" 

  # bin
  install -Dm755 src/${pkgname} -t "${pkgdir}/usr/bin"

  # doc
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -avR docs examples \
  	"${pkgdir}/usr/share/doc/${pkgname}"
}
