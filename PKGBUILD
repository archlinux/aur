# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=minidjvu
pkgver=0.8
pkgrel=5
pkgdesc='Highly efficient DjVu encoder for black-and-white images'
arch=(i686 x86_64)
url="http://$pkgname.sourceforge.net/"
license=(GPL)
depends=(libtiff)
source=(
	"http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
	depend-lib-app.patch
)
md5sums=(
	b354eb74d83c6e2d91aab2a6c2879ba7
	6df7ee0413af8f86211f97e73eacc36e
)

prepare() {
	for p in *.patch ; do patch -Np0 < $p ; done
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --libdir=/usr/lib
	sed -i -e 's#-9 \$(MANDIR)#-9 $(DESTDIR)$(MANDIR)#' Makefile
	make
}

package() {
	cd $pkgname-$pkgver
	install -d "$pkgdir"/usr/{bin,lib,share/man/man1}
	make DESTDIR="$pkgdir/" install
}

