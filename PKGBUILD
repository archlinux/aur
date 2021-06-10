# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Julien Taverna <jujudusud gmail com>

pkgname=jamulus
_pkgname=Jamulus
pkgver=3.8.0
pkgrel=2
pkgdesc="Internet jam session software"
arch=('x86_64')
url='https://jamulus.io/'
license=('GPL2')
depends=('glibc' 'gcc-libs' 'qt5-base' 'qt5-translations')
makedepends=('jack')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jamulussoftware/jamulus/archive/r${pkgver//./_}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-r${pkgver//./_}"
  qmake Jamulus.pro
  make clean
  make
}

package() {
  depends+=('libjack.so')
  cd "${srcdir}/${pkgname}-r${pkgver//./_}"
  install -Dm755 Jamulus "${pkgdir}/usr/bin/Jamulus"
  install -Dm644 distributions/jamulus.desktop "${pkgdir}/usr/share/applications/jamulus.desktop"
  install -Dm644 distributions/jamulus.svg "${pkgdir}/usr/share/pixmaps/jamulus.svg"
  install -Dm644 distributions/jamulus-server.desktop "${pkgdir}/usr/share/applications/jamulus-server.desktop"
  install -Dm644 distributions/jamulus-server.svg "${pkgdir}/usr/share/pixmaps/jamulus-server.svg"
  install -vDm 644 {ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}

sha1sums=('7c285c3dafd5cf8fc0184a2ef97e6cebdacf61ea')
