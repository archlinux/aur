# Maintainer: Semyon Maryasin <simeon@maryasin.name>
pkgname=dispatch_ng
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Load balancing software to speed up internet connection"
arch=(x86_64 armv7h)
url="https://gitlab.com/akash_rawal/dispatch_ng/"
license=('GPL3')
groups=()
depends=(libevent)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(${pkgname}-${pkgver}.tar.gz::https://bintray.com/akashrawal/${pkgname}/download_file?file_path=release-1.0%2F${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('8020b78637075981fd73d09c4c3a081f')

prepare() {
	cd "$srcdir/${pkgname}-$pkgver"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	libtoolize
	aclocal
	automake --add-missing
	autoconf
	mkdir -p build
	cd build
	../configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname}-$pkgver"
	cd build
	make -k check
}

package() {
	cd "$srcdir/${pkgname}-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
	install -Dm 644 ../README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
