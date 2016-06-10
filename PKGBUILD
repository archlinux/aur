# Maintainer: Monika Schrenk <moni@random-access.org>

pkgname=mongochef
pkgver=3.6.0
pkgrel=1
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://3t.io/mongochef/"
license=("custom")
depends=('java-runtime>=8')
makedepends=('unzip')
provides=('mongochef')

source=("mongochef.desktop" "mongochef")
source_i686=("https://cdn.3t.io/mongochef/linux/${pkgver}/mongochef-linux-x86-dist.tar.gz")
source_x86_64=("https://cdn.3t.io/mongochef/linux/${pkgver}/mongochef-linux-x64-dist.tar.gz")

sha256sums=('a603fd54a34f8aa59a70580fd4321db24f439ceb746545f1cf6c0216f7f8169e' 
'3ef9e38cfd7ab9e0f6e70cebd635f96a7bbaccf255de2c6ed4f7fd5a4aab3728')
sha256sums_i686=('47f87375fdef95a1c1e21ff2699361489a96756b513cba6055482afd29de2266')
sha256sums_x86_64=('d676468e9e1f23806b081810fa9e4462e6ad58991173e3d7c38efd1938da228e')

prepare() {
  unzip -j ${srcdir}/${pkgname}-${pkgver}-linux-*-dist/lib/data-man-gui-1.0-SNAPSHOT.jar "t3/dataman/icons/mc-512.png" -d "./"
  unzip -j ${srcdir}/${pkgname}-${pkgver}-linux-*-dist/lib/data-man-mongodb-pro-${pkgver}.jar "t3/utils/gui/3T-EULA.txt" -d "./"
}

package() {
  cd ${pkgdir}
  mkdir -p opt/

  cp -r ${srcdir}/${pkgname}-${pkgver}-linux-*-dist/lib opt/${pkgname}

  ## add startup script 
  install -D -m 755 $srcdir/${pkgname} usr/bin/${pkgname}

  ## add desktop entry
  install -D -m 644 ${srcdir}/${pkgname}.desktop usr/share/applications/${pkgname}.desktop
  
  ## add application icon
  install -D -m 644 ${srcdir}/mc-512.png usr/share/pixmaps/${pkgname}.png

  ## add license
  install -D -m 644 ${srcdir}/3T-EULA.txt usr/share/licenses/${pkgname}/3T-EULA.txt
}
