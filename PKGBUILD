# Maintainer: Daniel Dietrich <shaddow2k@@gmail..com>
# Contributor: bitwave <aur [aT] oomlu {d.0t} de>
pkgname=kleiner-brauhelfer
pkgver=1.4.4.1
_sourcename=01_04_04_01
_sourcename2=1_4_4_1
pkgrel=1
pkgdesc="A Qt-based tool for hobby brewer to calculate and manage the beer brewing process."
arch=("i686" "x86_64")
url="http://www.joerum.de/kleiner-brauhelfer"
license=('GPL3')
depends=('qt5-svg' 'qt5-webengine')
provides=('kleiner-brauhelfer')
source=("http://www.joerum.de/$pkgname/lib/exe/fetch.php?media=download:${_sourcename}:kb_source_${_sourcename2}.zip"
        kleiner-brauhelfer.desktop
        brauhelfer
        release.patch)

prepare() {
	cd "${srcdir}"
	patch -p1 -i release.patch
}

build() {
  mkdir -p build
  cd build

  cd "${srcdir}/${pkgname}-${pkgver}/source/"
  qmake-qt5 brauhelfer.pro
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}/source/"

  #bin
  install -d "$pkgdir/usr/bin/kleiner-brauhelfer"
  install -D -m755 "bin/kleiner-brauhelfer" "$pkgdir/usr/bin/kleiner-brauhelfer"
  install -D -m755 "${srcdir}/brauhelfer" "$pkgdir/usr/bin"

  # languages
  install -d "$pkgdir/usr/bin/kleiner-brauhelfer/languages"
  install -D -m644 "languages/"*.qm "$pkgdir/usr/bin/kleiner-brauhelfer/languages"
  install -D -m644 "languages/"*.png "$pkgdir/usr/bin/kleiner-brauhelfer/languages"

    #Desktop Launcher
  install -D -m644 "$srcdir/kleiner-brauhelfer.desktop" "$pkgdir/usr/share/applications/kleiner-brauhelfer.desktop"

  #Icon
  install -D -m644 "res/logo.svg" "$pkgdir/usr/share/pixmaps/kleiner-brauhelfer.svg"
}
sha256sums=('07f5dd74c845b4bd1833d7e801f9eb55a4a1fd898d7c2fa8c34dfeac4e243ed5'
            '737f4e890a9c5993865a4885e0291d4bdeba1a6586da67716b3bb6ff15e6ee61'
            '9d034a6c58a6adf7f584df6aba96251bcba52cdab65d661f0aa1a88761ed2067'
            '844563b3d7d6fc9288b2225ce28614bdf2acbaa6985fc85c31213068c5eb478a')
