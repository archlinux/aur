# Maintainer: aksr <aksr at t-com dot me>
pkgname=qxw
pkgver=20200708
pkgrel=1
pkgdesc="A program to help you create and publish crosswords."
arch=('i686' 'x86_64')
url="https://www.quinapalus.com/qxw.html"
license=('GPL')
depends=('gtk2')
source=(https://www.quinapalus.com/$pkgname-$pkgver.tar.gz
	https://www.quinapalus.com/$pkgname-guide-$pkgver.pdf)
md5sums=('ea0d24690b78e96d750191be4d1345f1'
         '32d0f84fad4e235ed513ebbdbe63789d')
sha1sums=('efbd08082eca37b7090eb94ca0fa094551e01e8d'
          '412e180f2a05e28cdd746528a3c3c88e4ed33338')
sha256sums=('ed6c6effb815789ec3f7214738c905570e58030e5b8e5b493fec8c70148d23ea'
            '6fe0472a180837b54352055392fbbb3bd68e7c0d6298ab876f127479708afdf6')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's!usr/games!usr/bin!' Makefile
	sed -i 's!usr/games!usr/bin!' qxw.desktop
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../qxw-guide-${pkgver}.pdf $pkgdir/usr/share/doc/$pkgname/qxw-guide-${pkgver}.pdf
}
