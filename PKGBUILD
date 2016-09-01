# Maintainer: Jonathon Fernyhough <jonathon@manjaro.org>

pkgname=lily
pkgver=0.17
pkgrel=1
pkgdesc='An interpreted language with a focus on expressiveness and type safety'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://beyondred.github.io/lily/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('lily')
conflicts=('lily')
source=("https://github.com/beyondred/lily/archive/v${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/beyondred/lily/master/license.txt')
sha256sums=('08c1b313cfb182f58dcf3ff843ea8fccdb0e9471e8e63d1652600bc899c0e0af'
            'e169a4a749995ef83c0939127180318e4d436bf47f039967c0c14d0de25c7a61')

prepare() {
	sed -i 's|"lily"|"include/lily"|' "$srcdir/lily-${pkgver}/src/CMakeLists.txt"
}

build() {
	cd "$srcdir/lily-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}

package() {
	cd "$srcdir/lily-${pkgver}"
	make DESTDIR="$pkgdir/" install
	install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
