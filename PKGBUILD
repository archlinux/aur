# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: N Fytilis <n-fit AT live.com>

pkgname=ntfs2btrfs-git
pkgver=20250616.r0.g2b4e00a
pkgrel=1
pkgdesc="In-place conversion of Microsoft's NTFS filesystem to the open-source filesystem Btrfs"
arch=('x86_64')
url="https://github.com/maharmstone/${pkgname%-git}"
license=('GPL-2.0-or-later')
depends=('fmt' 'zlib' 'lzo' 'zstd')
makedepends=('git' 'cmake' 'pkgconf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/release-//g;s/-/./g'
}

build() {
	cmake -B build -S "${pkgname%-git}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_SBINDIR=bin \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=OFF

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
