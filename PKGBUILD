# Maintainer: johnnybash <georgpfahler@wachenzell.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=lximage-qt
pkgver=0.5.0
pkgrel=2
pkgdesc="The LXQt image viewer"
arch=("i686" "x86_64")
groups=("lxqt")
url="http://lxqt.org"
license=("GPL2")
depends=("libfm-qt")
makedepends=("cmake" "qt5-tools")
install="$pkgname.install"
source=("https://downloads.lxqt.org/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=("bd67b8b81a25d8ecd858787af87bc97256f15821ff4f1bb3efcfd214e2929066" "SKIP")
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
