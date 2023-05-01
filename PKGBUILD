# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=ntfs2btrfs
pkgver=20230501
pkgrel=1
pkgdesc="In-place conversion of Microsoft's NTFS filesystem to the open-source filesystem Btrfs"
arch=('x86_64')
url="https://github.com/maharmstone/$pkgname"
license=('GPL2')
depends=('fmt' 'zlib' 'lzo' 'zstd')
makedepends=('cmake' 'pkgconf')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('15924a22e9d80e4ca28bf5524708dd8f69d840df1e781a659ce953fee7d90730')

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
