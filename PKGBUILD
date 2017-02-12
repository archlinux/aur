# Maintainer: Monika Schrenk <moni@random-access.org>

pkgname=studio-3t
pkgver=5.0.1
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

sha256sums=('fa04aeeca55ea61163200b998d63fd73733860ff08fe58b734e4cf356f4a0786' 
'c84a8462407ac2d300c34477c05c9545b7359cd1842879c2c321c88343b754f5')
sha256sums_i686=('b20fd9c43798f2ebdd6b5d04caab88dca2d9674c2c90f62c6d48d87a7b37b123')
sha256sums_x86_64=('72e6e8a695c908177fdb6aedd6b07d7516b6125fb2d0fad9cc1128150cfb7eb9')

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
