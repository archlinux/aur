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
sha512sums=('ad10850280f591cbdc169bb8e0b1768f7c4051b3110283c941ab76beb0d2b728d30ac64caecdbe6f90068b2486170ddced0704d741d1469944c58ecf0b168e0a')

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
