# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=uclibc-ng
pkgver=1.0.33
pkgrel=1
epoch=
pkgdesc="A C library for embedded Linux"
arch=(x86_64)
url="https://uclibc-ng.org/"
license=('LGPL2.1')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('staticlibs')
install=
changelog=
source=(
	"https://downloads.uclibc-ng.org/releases/$pkgver/uClibc-ng-$pkgver.tar.xz"
	"config"
)
noextract=()
sha512sums=('badc4bed19787d74813e1f050d5652fa48c69e9823f4c2d04e02074108250bdc25022776a6420c4afdcebcc0e8df61367da92f3a68ae8ff74a8e956983363095'
            '0318e67ead594929f54dec56377465fe1877a996d81c0bfbc4537745fb8a54bbdeaca8b43fb1a3196dc4ab9e680cc787aa8599fd11dcf28808d404fd61b65fda')

prepare() {
	cd "uClibc-ng-$pkgver"
	cp "$srcdir"/config .config
}

build() {
	cd "uClibc-ng-$pkgver"
	make all
}

package() {
	cd "uClibc-ng-$pkgver"
	make PREFIX="$pkgdir" install

	# configure RUNTIME_PREFIX with /lib for PT_INTERP compat, but install to /usr/lib
	mv "$pkgdir"/lib/ld64-uClibc*.so* "$pkgdir"/usr/lib/
	mv "$pkgdir"/lib/* "$pkgdir"/usr/lib/uClibc/lib/
	rmdir "$pkgdir"/lib
}
