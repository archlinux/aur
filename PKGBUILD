# Maintainer: Luis Sarmiento <lgsarmientop-ala-unal.edu.co>

pkgname=david
_PKGNAME=David
pkgver=1.36a
_pkgver=1_36a
pkgrel=3
pkgdesc="DAwn's Visual Intersection Debugger"
url="http://geant4.kek.jp/~tanaka/DAWN/About_DAVID.html"
arch=('x86_64' 'i686')
license=('unknown')
depends=('dawn')
source=("http://geant4.kek.jp/~tanaka/src/${pkgname}_${_pkgver}.taz"
	"make_DESTDIR.patch"
	)
md5sums=('520f056cea955295431ed8a1e9268f4b'
         'b8ce4a6fd298f16468739986e098b25a')

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
