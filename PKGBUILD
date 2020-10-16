# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# `fetch` author: John R. Marino <draco@marino.st>

pkgname=fetch
_gituser=jrmarino
_gitname=fetch-freebsd
pkgver=12.0.8
pkgrel=2
pkgdesc="FreeBSD fetch for Linux"
arch=('x86_64')
url="https://github.com/$_gituser/$_gitname"
license=('BSD-3-Clause')
depends=('libressl')
makedepends=('cmake' 'gcc' 'make')
source=("v$pkgver.zip::https://github.com/$_gituser/$_gitname/archive/v$pkgver.zip")
sha256sums=('ef2e7c5129134e0b9db27afcb3cdc404a41788788aeff9ed2dd9b12aebd1870b')

build() {
	cd "$_gitname-$pkgver"
	cmake -B build -S . -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX="/usr" -Wno-dev -DCMAKE_C_FLAGS="-O3" -DUSE_SYSTEM_SSL=ON -DFETCH_LIBRARY=ON
	make -C build -j1 # required, see jrmarino/fetch-freebsd#3 (GitHub)
}

package() {
	cd "$_gitname-$pkgver"
	make DESTDIR="$pkgdir" -C build install
}
