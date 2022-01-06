# Maintainer: bellotto <joangarcez2100@gmail.com>

pkgname=porth-gitlab
pkgver=0.55
pkgrel=1
pkgdesc="[Unstable/W.I.P] It's like Forth but in Python."
arch=('x86_64')
url="https://gitlab.com/tsoding/porth.git"
license=('MIT')
depends=('nasm' 'binutils' 'fasm')
makedepends=('git' 'fasm')
source=("git+https://gitlab.com/tsoding/porth.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-gitlab}"
	fasm -m 524288 ./bootstrap/porth-linux-x86_64.fasm
	chmod +x ./bootstrap/porth-linux-x86_64
	./bootstrap/porth-linux-x86_64 com -t fasm-linux-x86_64 ./porth.porth
	mv -v output porth
}

package() {
	cd "$srcdir/${pkgname%-gitlab}"
	
	mkdir -p "$pkgdir/usr/share/${pkgname%-gitlab}/examples"
	cp -R "examples/" "$pkgdir/usr/share/${pkgname%-gitlab}"
	
	mkdir -p "$pkgdir/usr/lib/${pkgname%-gitlab}"
	cp -RT "std/" "$pkgdir/usr/lib/${pkgname%-gitlab}/"
	
	mkdir -p "$pkgdir/usr/bin/"
	cp "porth" "$pkgdir/usr/bin/${pkgname%-gitlab}"
	
	mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-gitlab}/"
	cp "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-gitlab}/"
}
