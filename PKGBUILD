# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=stmviewer
pkgver=0.4.0
pkgrel=1
pkgdesc="Real-time STM32 variable & trace viewer."
arch=(x86_64)
url="https://github.com/klonyyy/STMViewer"
license=("GPL-3.0-only")
depends=(
	"libusb"
	"glfw"
	"glib2"
	"gtk3"
	"glibc"
	"libgl"
	"gcc-libs"
	"gdb>=12.1"
)

makedepends=("cmake")
source=("$pkgname-$pkgver::git+https://github.com/klonyyy/STMViewer.git#tag=v$pkgver")
sha256sums=("SKIP")

prepare() {
    cd $pkgname-$pkgver
    patch --forward --strip=1 --input=../../0000-fix-install.patch
}

build() {
	cd "$pkgname-$pkgver"
	cmake -B build . -GNinja \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-Wno-dev

	cmake --build build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" cmake --install build
}
