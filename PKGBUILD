# Maintainer: bitwave <aur [aT] oomlu {d.0t} de>
# Contributor: Daniel Dietrich <shaddow2k@@gmail..com>
pkgname=kleiner-brauhelfer
pkgver=1.4.4.2
pkgrel=1
pkgdesc="A Qt-based tool for hobby brewer to calculate and manage the beer brewing process."
arch=("i686" "x86_64")
url="http://www.joerum.de/kleiner-brauhelfer"
license=('GPL3')
depends=('qt5-svg' 'qt5-webengine')
provides=('kleiner-brauhelfer')
source=("https://github.com/Gremmel/$pkgname/archive/v$pkgver.tar.gz"
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
sha256sums=('23ef0fa366bb50feeef9951ddcdd858123f0397a33a10d0d0aadaf97e78deacc'
            '737f4e890a9c5993865a4885e0291d4bdeba1a6586da67716b3bb6ff15e6ee61'
            '9d034a6c58a6adf7f584df6aba96251bcba52cdab65d661f0aa1a88761ed2067'
            'f91b3193d5b6b8fead76062c1d93d01928a0badc178a125fa47461d769048ec5')
