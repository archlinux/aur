# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=ntfs2btrfs
pkgver=20220812
pkgrel=1
pkgdesc="In-place conversion of Microsoft's NTFS filesystem to the open-source filesystem Btrfs"
arch=('x86_64')
url='https://github.com/maharmstone/ntfs2btrfs'
license=('GPL2')
depends=('fmt' 'zlib' 'lzo' 'zstd')
makedepends=('cmake' 'pkgconf')
source=("https://github.com/maharmstone/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9ce07535e6191ab45f204a4dd281be4768d7917df4426ee7c71aa9c308a2fe93')

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
