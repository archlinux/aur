pkgname=mowitz
_pkgname=Mowitz
pkgver=0.3.1
pkgrel=4
pkgdesc='"More Widgets" library'
arch=("x86_64")
url="https://siag.nu/pub/mowitz/"
license=("GPL" "LGPL" "MIT")
depends=("libxpm" "libxaw" "nextaw")
source=("https://siag.nu/pub/mowitz/$_pkgname-$pkgver.tar.gz"
        "mowitz.patch")
sha256sums=("6a4a9b2342becf0dd8ecd65d87ac5f88beee84464d0553e1223b201d94b3dfff"
            "6c625233d8aa5f6a0ed5f55b0b0e6983ff6e6ec4be3cb290289bb13081f79e20")

prepare() {
	cd "$_pkgname-$pkgver"
	patch -p1 < ../mowitz.patch
}

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$_pkgname-$pkgver"
	make -k check
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	mkdir ${pkgdir}/usr/share/doc
	mv ${pkgdir}/usr/doc/Mowitz ${pkgdir}/usr/share/doc
	rmdir ${pkgdir}/usr/doc
}
