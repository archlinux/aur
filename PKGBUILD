# Maintainer: aksr <aksr at t-com dot me>
pkgname=metamath
pkgver=0.178
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
md5sums=('429ba85dba04cfbace53c28bd6b836a7'
         '662338c650f0be10cc53530cf4b70d09')
sha1sums=('f01688b68f32d7ca5edd779d8ec9d312d55da3e0'
          '3c69dcd66b8d31ae7acce490061c59199c6ad7ad')
sha256sums=('33b739b54d0a41aa68e5c3b3a36c6d1123afd92a822ee1fb6ad2168dc1dfcd80'
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

