# Maintainer: Breno Cunha Queiroz <admin@brenocq.com>
pkgname=atta
pkgver=0.0.1.1
pkgrel=2
pkgdesc="High-performance simulator for multi-robot systems (early stages)"
arch=(x86_64 i686)
url="https://github.com/Brenocq/Atta.git"
license=('MIT')
depends=('glfw' 'freetype2' 'vulkan-headers')
makedepends=('git')
provides=('atta')
source=("$pkgname::git://github.com/Brenocq/Atta.git")
md5sums=('SKIP')

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#pkgver() {
#	cd $pkgname
#	printf 0.0.1.1
#	# TODO get version from github last tag
#	#printf "0.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
	cd $pkgname
	mkdir -p build
	cd build
	cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=../../../pkg/atta/usr -D ATTA_GENERATE_PACKAGE_INSTALL=1 ..
	make -j
}

package() {
	cd $pkgname/build
	make install
	install -Dm755 ./atta $pkgdir/usr/bin/atta
	install -d $pkgdir/usr/include/
	install -d $pkgdir/usr/lib/
}
