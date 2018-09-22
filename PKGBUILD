# Maintainer: Ashymad <czilukim@o2.pl>
pkgname=sfk
_version=1.9.3
_revision=0
pkgver=${_version}.${_revision}
pkgrel=1
pkgdesc="Swiss File Knife - A Command Line Tools Collection"
arch=('x86_64')
url="http://stahlworks.com/dev/swiss-file-knife.html"
license=('BSD')
depends=('gcc-libs')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/swissfileknife/files/1-swissfileknife/${pkgver}/sfk-${_version}.tar.gz")
sha256sums=('64e5758b88c5fd1df3d5a97cb4abc26c2499f902b1d6c30dc434157aa2cd689d')

prepare() {
	cd "$pkgname-$_version"
	sed -i 's/typedef long long      int64_t;//g' ./sfkmatch.hpp
	sed -i 's/#define bool  unsigned char//g' ./sfkbase.hpp
}

build() {
	cd "$pkgname-$_version"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$_version"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
