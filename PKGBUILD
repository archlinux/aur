# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=klog
pkgver=2.3
pkgrel=1
pkgdesc='A multiplatform free hamradio logger'
arch=('x86_64')
url='https://www.klog.xyz'
license=('GPL3')
makedepends=('qt5-tools' 'gendesk')
depends=('qt5-base' 'qt5-charts' 'qt5-declarative' 'qt5-location' 'qt5-serialport' 'hamlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ea4k/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9ec9d754368f3bd7863b3f6821052cb626b60f86eb3a872257d10b2bc5280c08')

prepare() {
  cd "${pkgname}-${pkgver}"

  gendesk --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec "/usr/bin/${pkgname}" -n
}

build() {
  cd "${pkgname}-${pkgver}"

  qmake-qt5 PREFIX=/usr KLog.pro
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 src/build/target/klog "${pkgdir}/usr/bin/klog"
  install -Dm644 src/klog.1 "${pkgdir}/usr/share/man/man1/klog.1"
  install -Dm644 src/img/${pkgname}_512x512.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
