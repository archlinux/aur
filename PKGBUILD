# Maintainer: James Groom <OSSYoshiRulz at gmail dot com>
pkgname=libquicknes-dll
pkgver=0.7.0
pkgrel=2
pkgdesc="BizHawk's alternate Famicom/NES emulator core."
arch=("x86_64")
url="https://gitlab.com/TASVideos/libquicknes"
license=("unknown")
depends=("gcc-libs")
source=("https://gitlab.com/TASVideos/libquicknes/-/archive/$pkgver/libquicknes-$pkgver.tar.gz")
sha512sums=("2d537db42fd5b65b70e6c17524ab2d196bae62d077d93b0ecfaeb3409d16be0bbca8d7b3f0caa48c411cc87d8047d6d4e2e1f3f2549febdeeec68fb368f292ea")

build() {
	cd "libquicknes-$pkgver/mingw"
	make
	mv "libquicknes.dll" "../libquicknes.dll.so.$pkgver"
}

package() {
	_filename="libquicknes.dll.so"
	_majver="${pkgver%%.*}"
	install -Dm755 "libquicknes-$pkgver/$_filename.$pkgver" "$pkgdir/usr/lib/bizhawk/$_filename.$pkgver"
	ln -s "$_filename.$pkgver" "$pkgdir/usr/lib/bizhawk/$_filename.$_majver"
	ln -s "$_filename.$_majver" "$pkgdir/usr/lib/bizhawk/$_filename"
}
