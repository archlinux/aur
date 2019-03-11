# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=klog
pkgver=0.9.7.1
pkgrel=1
pkgdesc='A multiplatform free hamradio logger'
arch=('any')
url='https://www.klog.xyz'
license=('GPL3')
makedepends=('qt5-base' 'qt5-charts' 'qt5-tools' 'gendesk')
source=("http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1ced0bc840de1bdb915c610fc8fdc5c8e18283a64fa7c51f854b0f5697971de4')

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
