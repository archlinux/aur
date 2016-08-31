# Maintainer: Daniel Dietrich <shaddow2k@@gmail..com>

pkgname=kleiner-brauhelfer
pkgver=1.4.3.2
_sourcename=01_04_03_02
_sourcename2=1_4_3_2
pkgrel=1
pkgdesc="A Qt-based tool for hobby brewer to calculate and manage the beer brewing process."
arch=("i686" "x86_64")
url="http://www.joerum.de/kleiner-brauhelfer"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'qt5-webkit')
provides=('kleiner-brauhelfer')
install="${pkgname}.install"
source=("http://www.joerum.de/$pkgname/lib/exe/fetch.php?media=download:${_sourcename}:kb_source_${_sourcename2}.zip"
        kleiner-brauhelfer.desktop
        kleiner-brauhelfer.png)

build() {
  mkdir -p build
  cd build

  cd "${srcdir}/source/"
  qmake-qt5 brauhelfer.pro
  make
}

package(){
  cd "${srcdir}/source/"

  #bin
  install -d "$pkgdir/usr/bin/"
  install -D -m755 bin/brauhelfer "$pkgdir/usr/bin/"

  #Desktop Launcher
  install -D -m644 "$srcdir/kleiner-brauhelfer.desktop" "$pkgdir/usr/share/applications/kleiner-brauhelfer.desktop"

  #Icon
  install -D -m644 "$srcdir/kleiner-brauhelfer.png" "$pkgdir/usr/share/pixmaps/kleiner-brauhelfer.png"
}
md5sums=('3099492a96f5bfa04e7a835db4544abd'
         'e438fa17b10accfbe0561d34aacd916e'
         '6ae77b7221b09cd72d9f7181284998d5')
