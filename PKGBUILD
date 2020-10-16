# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# `fetch` author: John R. Marino <draco@marino.st>

pkgname=fetch
_gitname=fetch-freebsd
pkgver=12.0.8
pkgrel=1
pkgdesc="FreeBSD fetch for Linux"
arch=('x86_64')
url="https://github.com/ctrlcctrlv/$_gitname"
license=('BSD-3-Clause')
depends=('libressl')
makedepends=('cmake' 'gcc' 'make')
source=("v$pkgver.zip::https://github.com/ctrlcctrlv/$_gitname/archive/v$pkgver.zip")
sha256sums=('0c2c91b8799768b04693cb676aa0fdfb7c39825f8b42d7a4c129b02f8858cce6')

build() {
	cd "$_gitname-$pkgver"
	echo $pkgdir
	cmake -B build -S . -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX="/usr" -Wno-dev -DCMAKE_C_FLAGS="-O3"
	make -C build
}

package() {
	cd "$_gitname-$pkgver"
	make DESTDIR="$pkgdir" -C build install
}
