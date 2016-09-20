
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theweb
pkgver=15.0
pkgrel=0
pkgdesc="Web Browser based on CEF and Qt"
arch=("x86_64")
url="https://github.com/vicr123/theweb"
license=('GPL3')
depends=('kwidgetsaddons' 'xdg-utils' 'qtchooser' 'qt5-base')
makedepends=('git' 'clang')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theweb#branch=master'
	"http://opensource.spotify.com/cefbuilds/cef_binary_3.2704.1434.gec3e9ed_linux64_minimal.tar.bz2")
md5sums=('SKIP'
	 'SKIP')

build() {
	cp "cef_binary_3.2704.1434.gec3e9ed_linux64_minimal/Release/libcef.so" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/opt/theWeb"
	cp "$pkgname-$pkgver/theweb" "$pkgdir/opt/theWeb"
	cp -r "cef_binary_3.2704.1434.gec3e9ed_linux64_minimal/Release/"* "$pkgdir/opt/theWeb"
	cp -r "cef_binary_3.2704.1434.gec3e9ed_linux64_minimal/Resources/"* "$pkgdir/opt/theWeb"
	cp "$pkgname-$pkgver/libcef_dll_wrapper.a" "$pkgdir/opt/theWeb"
	chmod 4755 "$pkgdir/opt/theWeb/chrome-sandbox"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/theweb.desktop" "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/bin/"
	cp "$pkgname-$pkgver/theweb-execscript" "$pkgdir/usr/bin/theweb"
	mkdir -p "$pkgdir/usr/share/icons"
	cp "$pkgname-$pkgver/icon.svg" "$pkgdir/usr/share/icons/theweb.svg"
}
