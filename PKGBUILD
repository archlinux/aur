# Maintainer: schaap137 <dojo86@gmail.com>
pkgname=phoon
pkgver=20140814
pkgrel=1
pkgdesc="Displays a picture of the PHase of the mOON, either currently or at a specified date/time."
arch=('i686' 'x86_64')
url="https://acme.com/software/phoon/"
license=('BSD')
source=("https://acme.com/software/phoon/phoon_14Aug2014.tar.gz"
	phoon-makefile-destdir.patch)
sha512sums=('46158782534a1e1efab2ca5cba33489cc80aa1a9137af31c9f1ead83b4562aac9d296ef74c58779cb9ea3e9c9e8fb69c354fad3254b0b4d9b599b8a17bbb6d5e'
	    'fabcfdecca21420053cc90c207988547f057042623c75a9de1b8b3415155d83791bacf1c40ee7d90aa00ead90f28dd6af81d4a96c83517246e38fcad561cf061')

prepare() {
	cd "$srcdir"/"$pkgname"
	patch -p1 -i "$srcdir"/"$pkgname"-makefile-destdir.patch
}

build() {
	cd "$srcdir"/"$pkgname"
	sed -n '/phoon - p/,/ jef/p' README > LICENSE
	make
}

package() {
	cd "$srcdir"/"$pkgname"
        mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
        install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"
	mkdir -p "$pkgdir"/usr/local/{bin,man/man1}
	make DESTDIR="$pkgdir"/usr/local install
}
