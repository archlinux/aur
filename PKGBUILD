# maintainer : fenugrec
# contributors : xantares,  icarus 
pkgname=freediag
pkgver=1.06
pkgrel=1
pkgdesc="OBD-II vehicle diagnostic software and (mostly) J1978 compliant scan tool."
arch=('i686' 'x86_64')
url="http://freediag.sourceforge.net/"
license=('GPL')
makedepends=('cmake')
depends=('glibc')
optdepends=('fltk: needed for scangui front-end')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/1.0/$pkgname-$pkgver-src.tar.gz")
sha256sums=('dcd0ece685db9248d816a43a86d6aba3512d458f177ad80a7c07f75845d2ac44')

build() {
  cd "$pkgname-$pkgver-src"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILDGUI=ON -DUSE_RCFILE=ON -DUSE_INIFILE=OFF
  make
}


package () {
  cd "$pkgname-$pkgver-src"
  make DESTDIR="$pkgdir" install
  
  install -d "$pkgdir"/usr/share/doc/freediag/carsim_examples
  cp README* "$pkgdir"/usr/share/doc/freediag/
  #hax cleanup. CMakeLists.txt should really be fixed upstream for the next release
  mv "$pkgdir"/usr/bin/*.db "$pkgdir"/usr/share/doc/freediag/carsim_examples
  mv "$pkgdir"/usr/doc/* "$pkgdir"/usr/share/doc/freediag
  mv "$pkgdir"/usr/{A*,C*,R*} "$pkgdir"/usr/share/doc/freediag
  rmdir "$pkgdir"/usr/doc
}

