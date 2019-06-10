# Maintainer: Joel Pettersson <petterssonjoel@gmail.com>

pkgname=bruteforce-luks
pkgver=1.3.2
pkgrel=1
pkgdesc='Try to find the password of a LUKS encrypted volume.'
arch=('x86_64')
url='https://github.com/glv2/bruteforce-luks'
license=('GPL3')
depends=('cryptsetup')
source=("$pkgname-$pkgver.tar.xz::https://github.com/glv2/bruteforce-luks/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/glv2/bruteforce-luks/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.sig")
sha256sums=('85c902c581194703a4f72648372d49108f1e921aec9cd337b2d3a5d1c960dbb9'
            'e29d587e9d6fd3d0c9e2cda5feb6dea21a23fc24d6f4a4a80b538800a0779b2a')

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
