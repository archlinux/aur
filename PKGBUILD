# Maintainer: schaap137 <dojo86@gmail.com>
pkgname=globe
pkgver=20140814
pkgrel=1
pkgdesc="Shows an ASCII graphic of the currently-lighted face of the Earth."
arch=('i686' 'x86_64')
url="https://acme.com/software/globe/"
license=('BSD')
source=("https://acme.com/software/globe/globe_14Aug2014.tar.gz"
	globe-makefile-destdir.patch)
sha512sums=('4bf472ecbedb1582bc4caa71bdce3dd44914d9263d58277bc9b82184a8621fb2ebba26ad49aee7a29e625816009604b49fc02719c0a3cfe8351b70463b89bf46'
	    '0814b39b3328d55c381c99b48f967394d946c2885cb81fbb4b1468e069a6c386f77536a2f7fe6b05902cefa6cfef7ce31159053e9e4e3f8d08560d3a677848cb')

prepare() {
	cd "$srcdir"/"$pkgname"
	patch -p1 -i "$srcdir"/"$pkgname"-makefile-destdir.patch
}

build() {
	cd "$srcdir"/"$pkgname"
	sed -n '/A cute/,/ jef/p' README > LICENSE
	make
}

package() {
	cd "$srcdir"/"$pkgname"
        mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
        install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"
	mkdir -p "$pkgdir"/usr/local/{bin,man/man1}
	make DESTDIR="$pkgdir"/usr/local install
}
