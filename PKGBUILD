# Maintainer: Maximilian Schiller <manimax3@outlook.de>
pkgname=krpc-cpp
pkgver=0.4.8
pkgrel=1
pkgdesc="KRPC Client for c++"
arch=('any')
url="https://github.com/krpc/krpc"
license=('LGPL3')
groups=()
depends=('asio' 'protobuf')
source=("https://github.com/krpc/krpc/releases/download/v$pkgver/$pkgname-$pkgver.zip" "https://gist.githubusercontent.com/manimax3/dbf7c75640071bb0cf3c41405fe1a0b7/raw/ddc67527030b4d3e8924db4050969b747f0a598f/krpc-cpp-asio-fix.patch")
md5sums=('143c6230784a699dbe21d62923f12672'
         'a1b12b52009fb1a5a9ae490d1c3bf123')

prepare() {
	cd "$pkgname-$pkgver"
	patch --forward --strip=1 --input="${srcdir}/krpc-cpp-asio-fix.patch"	
}

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX='/usr/'
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
