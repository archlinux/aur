# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgbase=med-fichier
pkgname=('med-fichier' 'med-fichier-doc' 'med-fichier-dev')
pkgver=3.0.6
pkgrel=1
pkgdesc="MED-fichier library"
arch=(i686 x86_64)
url="https://packages.debian.org/en/source/sid/med-fichier"
license=('unknown')
makedepends=('gcc-fortran' 'hdf5' 'tk')
source=("http://ftp.de.debian.org/debian/pool/main/m/med-fichier/med-fichier_3.0.6.orig.tar.gz")
sha256sums=('e1e259fcb756c15417b8fab37ad690e7db9997e1a533125729305f396d8fe97a')

prepare() {
  cd "$srcdir/med-${pkgver}_SRC"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/med-${pkgver}_SRC"
  make
  make DESTDIR="$srcdir/dist" install
}

package_med-fichier() {
  depends=('hdf5' 'tk')

  cd "$srcdir/dist/usr"
  mkdir -p  "$pkgdir/usr"
  cp {lib,bin}/ "$pkgdir/usr/" -r
}

package_med-fichier-doc() {
  arch=(any)

  cd "$srcdir/dist/usr/share"
  mkdir -p  "$pkgdir/usr/share/doc/med"
  cp doc/ "$pkgdir/usr/share/doc/med/" -r
}

package_med-fichier-dev() {
  depends=('med-fichier')
  arch=(any)

  cd "$srcdir/dist/usr"
  mkdir -p  "$pkgdir/usr"
  cp include/ "$pkgdir/usr/" -r
}