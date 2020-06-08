# Maintainer: Joel Pettersson <petterssonjoel@gmail.com>

pkgname=bruteforce-luks
pkgver=1.4.0
pkgrel=1
pkgdesc='Try to find the password of a LUKS encrypted volume.'
arch=('x86_64')
url='https://github.com/glv2/bruteforce-luks'
license=('GPL3')
depends=('cryptsetup')
source=("$pkgname-$pkgver.tar.xz::https://github.com/glv2/bruteforce-luks/releases/download/$pkgver/$pkgname-$pkgver.tar.lz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/glv2/bruteforce-luks/releases/download/$pkgver/$pkgname-$pkgver.tar.lz.sig")
sha256sums=('808c5b9407ff4499455063383eefeeb3349047a4a7f29432df15d2b916cd5c79'
            '9b836ad641f54486b43a3aa0c283fdac947909cb4ced30874a6303b53f6f8188')

validpgpkeys=('245302B1BAB1F867FDCA96BC8F3F861F82EB7A9A') # Guillaume LE VAILLANT <glv@posteo.net>

prepare() {
	cd "$pkgname-$pkgver"
	autoreconf --force --install
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
