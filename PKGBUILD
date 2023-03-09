# Maintainer: Augugrumi <augugrumi@gmail.com>

pkgname=libviface-git
_pkg="${pkgname%-git}"
pkgver=r75.4f33d05
pkgrel=1
epoch=1
pkgdesc="C++ bindings for Linux tun/tap and netdevice interface"
arch=('x86_64')
url="https://github.com/hpenetworking/libviface"
license=('Apache')
groups=('linux-tools')
depends=('gcc-libs')
optdepends=('libtins: packets manipulation')
makedepends=('cmake' 'git')
provides=("$_pkg=1.1.0")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake \
		-B build \
		-S "$_pkg" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
