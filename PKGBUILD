# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=ntfs2btrfs
pkgver=20250616
pkgrel=1
pkgdesc="In-place conversion of Microsoft's NTFS filesystem to the open-source filesystem Btrfs"
arch=('x86_64')
url="https://github.com/maharmstone/$pkgname"
license=('GPL-2.0-or-later')
depends=('fmt' 'zlib' 'lzo' 'zstd')
makedepends=('cmake' 'pkgconf')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('86d7964667d1109f509d9a7972391d6294f18006ace63f8a9221ee8b74057273fe0cffdcd2c59bfc2b084eaccc1ba56ddc8ec3bb87a97d3e36d64f23aca8d7f1')

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
