# Maintainer: Sven Fischer <sven@leiderfischer.de>
# Contributor: Tomas Jasek <tomsik68(at)gmail(dot)com>
# Contributor: Aisberg
# Contributor: The_Loko

pkgname="smarthome-designer"
pkgver="0.8.0"
pkgrel=2
pkgdesc="A flexible framework for the smart home - Eclipse based Designer"
arch=('i686' 'x86_64')
url="https://www.eclipse.org/smarthome/index.html"
license=('GPL3')
groups=()
depends=('java-runtime')
makedepends=(tar)
optdepends=('webkitgtk2: internal browser support' 
			'chromium: internal browser support'
		   )
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_i686=("linux-i686.zip::https://eclipse.org/downloads/download.php?file=/smarthome/releases/${pkgver}/eclipsesmarthome-incubation-${pkgver}-designer-linux.zip&r=1")
source_x86_64=("linux-x86_64.zip::https://eclipse.org/downloads/download.php?file=/smarthome/releases/${pkgver}/eclipsesmarthome-incubation-${pkgver}-designer-linux64.zip&r=1")
source=("smarthome-designer.desktop" "smarthome-designer.png")
md5sums=('f59cd7e26ac83e2222afbe8f2094f63a'
         'dba65c384f5aba124447a9522abc747e')
md5sums_i686=('2307a53b203d473c62b26e93d58b0259')
md5sums_x86_64=('134f59ac9056d8de10f1701fb44ad791')

#noextract=("${source[@]%%::*}")
noextract=("linux-x86_64.zip")

prepare() {
  echo $noextract
  cd $srcdir
  mkdir -p smarthome-designer
  cd smarthome-designer
  bsdtar -xf ../linux-$CARCH.zip
}
build() {
  echo 'exec /usr/lib/smarthome-designer/SmartHome-Designer' > $srcdir/launcher
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/
  mv smarthome-designer $pkgdir/usr/lib/
  install -Dm775 $srcdir/launcher $pkgdir/usr/bin/smarthome-designer
  install -Dm644 $srcdir/smarthome-designer.desktop "${pkgdir}/usr/share/applications/smarthome-designer.desktop"
  install -Dm644 $srcdir/smarthome-designer.png "${pkgdir}/usr/lib/smarthome-designer/smarthome-designer.png"
}
