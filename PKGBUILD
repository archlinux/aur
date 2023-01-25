# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=refl-cpp
pkgver=0.12.3
pkgrel=1
epoch=
pkgdesc="A modern compile-time reflection library for C++ with support for overloads, templates, attributes and proxies"
arch=('any')
url="https://github.com/veselink1/refl-cpp"
license=('MIT')
groups=()
depends=()
makedepends=("dos2unix" "cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('79579c94fdf948020588cdfdb09e98c4b1941512c59ac5ee3bef81954863d66d')

prepare() {
	cd "$pkgname-$pkgver"

	mkdir -p build
	dos2unix include/*.hpp
}

build() {
	cd "$pkgname-$pkgver/build"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install

	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
