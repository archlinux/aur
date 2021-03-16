# This is the teonet PKGBUILD file. Use the `makepkg -si --noconfirm` command 
# to create and install this package. 

# Maintainer: Kirill Scherba <kirill@scherba.ru>
pkgname=teonet
pkgver=0.4.6
pkgrel=1
epoch=
pkgdesc="Teonet C library"
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=()
depends=("libev" "confuse" "cunit")
makedepends=("git" "cmake" "intltool" "doxygen")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("develop.tar.gz::https://github.com/teonet-co/teonet/archive/develop.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	git clone -b feature/arch_linux_aur_package_create https://github.com/teonet-co/teonet "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	git submodule update --init --recursive
	sh/build-arch.sh --none
	./autogen.sh
	./configure --prefix=/usr
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

