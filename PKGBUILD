# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=uclibc-ng
pkgver=1.0.34
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
sha512sums=('65822e36f8fff7852af208c11f25cfc33b4b4bc7d90977ab83abf777f0ca5173afb01830f6752b6fb1d9ed35c91f312c4cb5cad967b4d5cdc7cd65f0ebaabe55'
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
