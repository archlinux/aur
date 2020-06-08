# Maintainer: aksr <aksr at t-com dot me>
pkgname=metamath
pkgver=0.182
pkgrel=1
pkgdesc="A tiny language that can express theorems in abstract mathematics, accompanied by proofs that can be verified."
arch=('i686' 'x86_64')
url="http://us.metamath.org/"
license=('GPL')
install="${pkgname}".install
source=("http://us.metamath.org/downloads/$pkgname.tar.gz"
        "http://us.metamath.org/downloads/$pkgname.pdf")
md5sums=('26a542db0bc5d860168c3c83d0305980'
         '662338c650f0be10cc53530cf4b70d09')
sha1sums=('b239af053e8274f10eb0b8da62a40e921ec08ff8'
          '3c69dcd66b8d31ae7acce490061c59199c6ad7ad')
sha256sums=('493d69958d5ef06561fc21b6d0759a305c427796f613f76fd888ad07bb837deb'
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
