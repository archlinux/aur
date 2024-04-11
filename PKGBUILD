# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=ntfs2btrfs
pkgver=20240115
pkgrel=1
pkgdesc="In-place conversion of Microsoft's NTFS filesystem to the open-source filesystem Btrfs"
arch=('x86_64')
url="https://github.com/maharmstone/$pkgname"
license=('GPL2')
depends=('fmt' 'zlib' 'lzo' 'zstd')
makedepends=('cmake' 'pkgconf')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c614e33b83a4dad25b07335f42161223804935bbee19a72a6576fe361a7edf91502773facc14c767e02abff03fd26d902ab2cd0d8f8bcde8ba10c56869d01873')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_SBINDIR=bin \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=OFF

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
