# Maintainer: Luis Sarmiento <lgsarmientop-ala-unal.edu.co>

pkgname=david
_PKGNAME=David
pkgver=1.36a
_pkgver=1_36a
pkgrel=4
pkgdesc="DAwn's Visual Intersection Debugger"
url="http://geant4.kek.jp/~tanaka/DAWN/About_DAVID.html"
arch=('x86_64' 'i686')
license=('unknown')
depends=('dawn')
source=("http://geant4.kek.jp/~tanaka/src/${pkgname}_${_pkgver}.taz"
	"make_DESTDIR.patch"
	)
sha256sums=('61c77a7290a602e97f6664fbc613e3fb834cb87c525b0bc6dc5b1ea060f733ab'
            '93ef37f00e7a6a4b43a377e48b69bb600ac26e667ab3c8af3d8eaf7a2afc284e')

build() {
  cd "${srcdir}/${pkgname}_${_pkgver}"
  make
}

package() {
	  cd "${srcdir}/${pkgname}_${_pkgver}"
	  patch -Np2 < ${srcdir}/make_DESTDIR.patch
	  [ -d $pkgdir/usr/bin/ ] || install -d $pkgdir/usr/bin/
	  make DESTDIR="${pkgdir}" install

	  echo "
	  [Desktop Entry]
	  Name=${_PKGNAME}
	  Comment=${pkgdesc}
	  Exec=${pkgname}
	  Icon=xchm-32
	  Terminal=false
	  Type=Application
	  Categories=Utility;Science;
	  StartupNotify=false
	  " > $srcdir/$pkgname.desktop
	  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
