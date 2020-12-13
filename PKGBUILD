# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Julien Taverna <jujudusud gmail com>

pkgname=jamulus
_pkgname=Jamulus
pkgver=3.6.2
pkgrel=1
pkgdesc="Internet jam session software"
arch=('x86_64')
url='http://llcon.sourceforge.net/'
license=('GPL2')
depends=('glibc' 'gcc-libs' 'qt5-base')
makedepends=('jack')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/corrados/jamulus/archive/r${pkgver//./_}.tar.gz")

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
  install -Dm644 distributions/jamulus.png "${pkgdir}/usr/share/pixmaps/jamulus.png"
  install -vDm 644 {ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
  sed -e 's%^Name=Jamulus%Name=Jamulus (server)%' -e 's%^Exec=Jamulus$%Exec=Jamulus -s%' \
     "${pkgdir}/usr/share/applications/jamulus.desktop" > "${pkgdir}/usr/share/applications/jamulus-server.desktop"
}

sha1sums=('b161f6738f35607a5dac59525c6b69e812548a7c')

