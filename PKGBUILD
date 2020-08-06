# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=klog
pkgver=1.2
pkgrel=1
pkgdesc='A multiplatform free hamradio logger'
arch=('x86_64')
url='https://www.klog.xyz'
license=('GPL3')
makedepends=('qt5-tools' 'gendesk')
depends=('qt5-base' 'qt5-charts' 'qt5-serialport')
source=("http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6fc56c037c3c803e7e552fe5473d0ee9c24319f30290539c5b2d897e57d969c2')

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

  install -Dm644 klog.1 "${pkgdir}/usr/share/man/man1/klog.1"
  install -Dm755 build/target/klog "${pkgdir}/usr/bin/klog"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${srcdir}/${pkgname}-${pkgver}/img"

  install -Dm644 ${pkgname}_512x512.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
