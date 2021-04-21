# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
pkgname=torrent7z
pkgver=1.3
pkgrel=1
pkgdesc="A fork of torrent7z, viz a derivative of 7zip that produces invariant .7z archives for torrenting"
arch=('x86_64')
url="https://github.com/BubblesInTheTub/torrent7z"
license=('GPL3')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'fix-gcc-error.patch')
md5sums=('2465a59918a47d010c07794e70e06194'
         '508ab9a64875758be785d0665a5263bd')

prepare() {
	cd $pkgname-$pkgver
	patch -p1 < ../fix-gcc-error.patch
}

build() {
	cd $pkgname-$pkgver
	make -C linux_src/p7zip_4.65
}

package() {
	cd $pkgname-$pkgver
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/bin linux_src/p7zip_4.65/bin/t7z
}
