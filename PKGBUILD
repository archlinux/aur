# Maintainer: aksr <aksr at t-com dot me>
pkgname=metamath
pkgver=0.198
pkgrel=1
pkgdesc="A tiny language that can express theorems in abstract mathematics, accompanied by proofs that can be verified."
arch=('i686' 'x86_64')
url="http://us.metamath.org/"
license=('GPL')
install="${pkgname}".install
source=("http://us.metamath.org/downloads/$pkgname.tar.gz"
	"http://us.metamath.org/downloads/$pkgname.pdf")
md5sums=('dd14f58b18f786db7b7f5b7b4c69f35e'
         '662338c650f0be10cc53530cf4b70d09')
sha1sums=('adddd8fc3597debc2a846946356195a77467a574'
          '3c69dcd66b8d31ae7acce490061c59199c6ad7ad')
sha256sums=('c3bb77a1004f4be16dd7a45375a2debf291c32ef189048385152ee2f678d426e'
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
	#install -Dm644 LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
