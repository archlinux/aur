# Maintainer: Mikael Eriksson <miffe@miffe.org>

pkgname=lstypec
pkgver=0.4.0
pkgrel=1
pkgdesc="Know your USB-C Ports"
arch=('x86_64')
url="https://github.com/Rajaram-Regupathy/libtypec"
license=('GPL')
depends=('systemd-libs')
makedepends=('cmake' 'git')
source=("libtypec::git+https://github.com/Rajaram-Regupathy/libtypec.git#tag=libtypec-$pkgver")
sha256sums=('SKIP')

build() {
	cd "libtypec"
	cmake -B build-libtypec -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_SKIP_RPATH=YES
	cmake --build build-libtypec
	cmake -B build-lstypec utils -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_SKIP_RPATH=YES
	cmake --build build-lstypec
}

package() {
	cd "libtypec"
	DESTDIR="$pkgdir" cmake --install build-libtypec
	install -Dm755 build-lstypec/lstypec "$pkgdir/usr/bin/lstypec"
	install -Dm755 build-lstypec/typecstatus "$pkgdir/usr/bin/typecstatus"
}
