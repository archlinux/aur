# Maintainer: Monika Schrenk <moni@random-access.org>

pkgname=mongochef
pkgver=4.3.0
pkgrel=2
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://3t.io/mongochef/"
license=("custom")
depends=('java-runtime-openjdk=8' 'java-openjfx')
makedepends=('unzip')
provides=('mongochef')

source=("mongochef.desktop" "mongochef")
source_i686=("$pkgname-$pkgver-x86.tar.gz::https://cdn.3t.io/mongochef-core/linux/${pkgver}/mongochef-linux-x86-dist.tar.gz")
source_x86_64=("$pkgname-$pkgver-x64.tar.gz::https://cdn.3t.io/mongochef-core/linux/${pkgver}/mongochef-linux-x64-dist.tar.gz")

sha256sums=('a603fd54a34f8aa59a70580fd4321db24f439ceb746545f1cf6c0216f7f8169e' 
'3b03d036ccfa0e25b3f797a8f9fd6076b7b6dd131ab04879cb92d5aa130b8df1')
sha256sums_i686=('2010660414f8731f4e2867b8f3ddd4f9e7f8a5f30004805c6f1b6000adb91489')
sha256sums_x86_64=('267f8b7a3b1659a2a82a5ca95783e4329e269bab7b6c36eb8575c6b06b5bc9c8')

prepare() {
  unzip -j ${srcdir}/${pkgname}-${pkgver}-linux-*-dist/lib/data-man-gui-1.0-SNAPSHOT.jar "t3/dataman/icons/mc-512.png" -d "./"
  unzip -j ${srcdir}/${pkgname}-${pkgver}-linux-*-dist/lib/data-man-mongodb-core-${pkgver}.jar "t3/utils/gui/3T-EULA.txt" -d "./"
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
