# Maintainer: aksr <aksr at t-com dot me>
pkgname=metamath
pkgver=0.177
pkgrel=1
epoch=
pkgdesc="A tiny language that can express theorems in abstract mathematics, accompanied by proofs that can be verified."
arch=('i686' 'x86_64')
url="http://us.metamath.org/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("http://us.metamath.org/downloads/$pkgname.tar.gz"
        "http://us.metamath.org/downloads/$pkgname.pdf")
noextract=()
options=()
md5sums=('4e1ae1c28e8230f27bcbed8f405356b4'
         '662338c650f0be10cc53530cf4b70d09')
sha1sums=('3fd89039fbec5ca60e7b122865d63ece3282e820'
          '3c69dcd66b8d31ae7acce490061c59199c6ad7ad')
sha256sums=('8fa2ef678ae4b68370ed2c649f45744ed5c63fbf61fba77135904e27d3f5b56d'
            '245ebab16d148a9772f6c3751ba8f34ee15bed6bbb61a464f4c2a2f9c56f8059')

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README.TXT $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 ../metamath.pdf $pkgdir/usr/share/doc/$pkgname/metamath.pdf
  install -Dm644 LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

