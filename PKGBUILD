# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=ntfs2btrfs
pkgver=20260810
pkgrel=1
pkgdesc="In-place conversion of Microsoft's NTFS filesystem to the open-source filesystem Btrfs"
arch=('x86_64')
url="https://github.com/maharmstone/$pkgname"
license=('GPL-2.0-or-later')
depends=('fmt' 'zlib' 'lzo' 'zstd')
makedepends=('cmake' 'ninja' 'pkgconf')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('806df1e4d14943241fda83a83795954c5caba6cd4a219169d2f4b349a61d52135bd601e2298eb3ee38cf34f7e164157215dff5c509df7886e6c6aab8cbc5feb4')

build() {
	cmake -B build -G Ninja -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_SBINDIR=bin \
		-DCMAKE_BUILD_TYPE=Release

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
