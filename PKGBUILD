# Maintainer: sum01 <sum01@protonmail.com>
pkgname=platformfolders
_realpkgname=PlatformFolders
pkgver=3.1
pkgrel=2
pkgdesc='A C++ library to look for special directories like "My Documents" and "%APPDATA%" so that you do not need to write Linux, Windows and Mac OS X specific code'
arch=('i686' 'x86_64')
url="https://github.com/sago007/PlatformFolders"
license=('MIT')
makedepends=('cmake>=3.0.0' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sago007/PlatformFolders/archive/${pkgver}.tar.gz")
sha512sums=('62e73fe049759584b9fa245820ced54e01c110f100ddf2de58d5f8b287ae899515eb61dcb9dd8d9411b955c75caf64f019df4516723de61358568d5d8a07c507')
build() {
	mkdir -p "$srcdir/$_realpkgname-$pkgver/build"
	cd "$srcdir/$_realpkgname-$pkgver/build"
	# Install under /usr/lib instead of /usr/lib64
	cmake -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
	make
}
check() {
	cd "$srcdir/$_realpkgname-$pkgver/build"
	cmake -DBUILD_TESTING=ON ..
	make
	ctest
}
package() {
	cd "$srcdir/$_realpkgname-$pkgver/build"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}
