# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=klog
pkgver=1.5
pkgrel=1
pkgdesc='A multiplatform free hamradio logger'
arch=('x86_64')
url='https://www.klog.xyz'
license=('GPL3')
makedepends=('qt5-tools' 'gendesk')
depends=('qt5-base' 'qt5-charts' 'qt5-serialport' 'hamlib')
source=("https://github.com/ea4k/${pkgname}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sums=('42d09b330db0ad598ea5a2351d5c79d30712c1137fe201c60fd0ad10974c54f2')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  gendesk --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec "/usr/bin/${pkgname}" -n
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  qmake-qt5 PREFIX=/usr KLog.pro
  make
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  install -Dm755 src/build/target/klog "${pkgdir}/usr/bin/klog"
  install -Dm644 src/klog.1 "${pkgdir}/usr/share/man/man1/klog.1"
  install -Dm644 src/img/${pkgname}_512x512.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
