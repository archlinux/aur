# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=zarchive
pkgver=0.1.2
pkgrel=1
pkgdesc="Library for creating and reading zstd-compressed file archives (.zar)"
arch=('x86_64')
url="https://github.com/Exzap/ZArchive"
license=('MIT')
depends=('zstd')
makedepends=('cmake')
provides=('zarchive')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b9666e8e86e5162b4ee641905a288088311d5cd1af510b2fbf22eba722ad2d8ca43a081b14c0106743807eff256bac9a0cacbdeb06e8ccad0e8d5b9ed8fa886e')

build() {
	cd "ZArchive-$pkgver"
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="Release" ..
	make
}

package() {
	cd "ZArchive-$pkgver"
	install -Dm664 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd build
	make DESTDIR="$pkgdir/" install
}
