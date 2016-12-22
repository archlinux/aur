# Maintainer: johnnybash <georgpfahler@wachenzell.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=lximage-qt
pkgver=0.5.1
pkgrel=1
pkgdesc="The LXQt image viewer"
arch=("i686" "x86_64")
groups=("lxqt")
url="http://lxqt.org"
license=("GPL2")
depends=("libfm-qt" "desktop-file-utils" "gtk-update-icon-cache")
makedepends=("cmake" "qt5-tools" "git" "lxqt-build-tools")
source=("https://github.com/lxde/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=("a33077861a4c6cfe3330e29bbfec86801c0e46fd0fc6a8b8e6b29fc8d6753553" "SKIP")
validpgpkeys=('7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3')

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
