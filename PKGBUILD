# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=doschk
pkgver=1.1
_debianpatch=6
pkgrel=1
pkgdesc="Checks filenames for compatibility with SYSV and MS-DOS limits."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/${pkgname}/"
license=('GPL')
depends=()
source=(http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
        http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}-${_debianpatch}.diff.gz)
sha256sums=(ea29748a48a3d8433a2f29059e3a760354a13e01d7a3f00237c5bd9e980c9f38
            eecf830955648af177cb1772251a14d3725001c59bea627b7f319c1d4e04a41f)

build() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  patch -p1 < "$srcdir"/${pkgname}_${pkgver}-${_debianpatch}.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  make DESTDIR="$pkgdir/" install
  install -D -m 644 doschk.1 "$pkgdir"/usr/share/man/man1/doschk.1
}
