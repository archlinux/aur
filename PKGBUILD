# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=hex2bin
pkgdesc='Hex to binary converter'
pkgver=1.12
pkgrel=1
arch=(x86_64)
license=(GPL-3.0-only)
url=https://github.com/Keidan/hex2bin
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
makedepends=(cmake python)
depends=(glibc)
sha256sums=('cc9e4ee6791cdbbb9b24725a61258b90331888f3b7e33517e88bb84df411906f')

build () {
	rm -rf _build
	cmake -S "$pkgname-$pkgver" -B _build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=none \
		-DDISTRIBUTION=release \
		-DDEFSTART=0 -DDEFLIMIT=0
	cmake --build _build
}

check () {
	cd "$pkgname-$pkgver"
	python test.py -f bin/hex2bin
}

package () {
    install -Dm0755 "$pkgname-$pkgver/bin/hex2bin" -t "$pkgdir/usr/bin/"
}
