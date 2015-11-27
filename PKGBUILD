# Maintainer: Monika Schrenk <moni@random-access.org>

pkgname=mongochef
pkgver=3.1.0
pkgrel=1
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://3t.io/mongochef/"
license=("custom")
depends=('java-runtime>=1.6')
makedepends=('unzip')
provides=('mongochef')

source=("mongochef.desktop" "mongochef")
source_i686=("https://cdn.3t.io/mongochef/linux/${pkgver}/mongochef-linux-x86-dist.tar.gz")
source_x86_64=("https://cdn.3t.io/mongochef/linux/${pkgver}/mongochef-linux-x64-dist.tar.gz")

sha256sums=('a603fd54a34f8aa59a70580fd4321db24f439ceb746545f1cf6c0216f7f8169e' 
'223ffeb9aac96383f4e834f2d5ce63f8ca2469fbd9d60dfa5c57a09d42b64458')
sha256sums_i686=('b8389b00e4a8876f8c0720b81937353e0974dffc60f4c98f77100e033af5cfb4')
sha256sums_x86_64=('b0de66bc87a22697091a62e0a50a5a8f3bb93ef35300cf5224db71003f677841')

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

  ## add licence
  install -D -m 644 ${srcdir}/3T-EULA.txt usr/share/licences/${pkgname}/3T-EULA.txt
}
