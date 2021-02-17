# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=doschk
pkgver=1.1
_debianpatch=7
pkgrel=3
pkgdesc="Checks filenames for compatibility with SYSV and MS-DOS limits."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/${pkgname}/"
license=('GPL')
source=("https://deb.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        "https://deb.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}-${_debianpatch}.diff.gz")
b2sums=('6afb26eaf44412f36654ee90b7aa67fcdfa002ff7bc31f8221897d424a8c87f2319632de627c9234935d840a910d1635d4c053f854b0e6404f2de62a151cc0ed'
        '5d584401e97e8db238073d85cfb9b274caadb31bde809231c997ab72ffbe41d545a0a371bde9c8402b874ef7f9f8bd67f9e13db36ac3d32120fca3a1ef6c703a')

build() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  patch -p1 < "$srcdir"/${pkgname}_${pkgver}-${_debianpatch}.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  make DESTDIR="$pkgdir" install
  install -D -m 644 doschk.1 "$pkgdir"/usr/share/man/man1/doschk.1
}
