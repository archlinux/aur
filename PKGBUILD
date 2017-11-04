# Maintainer: Monika Schrenk <moni@random-access.org>

pkgname=studio-3t
pkgver=5.6.3
pkgrel=1
pkgdesc="The world's favorite IDE for working with MongoDB, formerly known as MongoChef."
arch=('i686' 'x86_64')
url="https://studio3t.com"
license=("custom")
depends=('java-runtime-openjdk=8' 'java-openjfx' 'gtk2')
makedepends=('unzip')
provides=('studio-3t')
replaces=('mongochef')

source=("${pkgname}.desktop" "${pkgname}")
source_i686=("$pkgname-$pkgver-x86.tar.gz::https://download.studio3t.com/studio-3t/linux/${pkgver}/${pkgname}-linux-x86.tar.gz")
source_x86_64=("$pkgname-$pkgver-x64.tar.gz::https://download.studio3t.com/studio-3t/linux/${pkgver}/${pkgname}-linux-x64.tar.gz")

sha256sums=('b51ed1a6897541f52d60aa2b6e5add005cba31dabf7992e2177cfea6ab8fc070'
            'c84a8462407ac2d300c34477c05c9545b7359cd1842879c2c321c88343b754f5')
sha256sums_i686=('bc3db0385d67cbe906c9c1c61d328589d165e9b8f4b37f6940021b1776ee9f1a')
sha256sums_x86_64=('efff641d6b2856acbf172c2b29de62e27b5d18a14edf09a2f5151040aa66651e')

prepare() {
  unzip -j ${srcdir}/${pkgname}-${pkgver}-linux-*/lib/data-man-mongodb-ent-${pkgver}.jar "t3/dataman/icons/mac/512.png" -d "./"
  unzip -j ${srcdir}/${pkgname}-${pkgver}-linux-*/lib/data-man-mongodb-ent-${pkgver}.jar "t3/utils/gui/3T-EULA.txt" -d "./"
}

package() {
  cd ${pkgdir}
  mkdir -p opt/

  cp -r ${srcdir}/${pkgname}-${pkgver}-linux-*/lib opt/${pkgname}

  ## add startup script 
  install -D -m 755 $srcdir/${pkgname} usr/bin/${pkgname}

  ## add desktop entry
  install -D -m 644 ${srcdir}/${pkgname}.desktop usr/share/applications/${pkgname}.desktop
  
  ## add application icon
  install -D -m 644 ${srcdir}/512.png usr/share/pixmaps/${pkgname}.png

  ## add license
  install -D -m 644 ${srcdir}/3T-EULA.txt usr/share/licenses/${pkgname}/3T-EULA.txt
}
