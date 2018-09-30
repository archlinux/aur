# Maintainer: Ward Segers <w@rdsegers.be>
pkgname=qpasm
pkgver=1.3
pkgrel=2
kgdesc="pseudo-assembler interpreter"
arch=("x86_64")
url="https://github.com/synio-wesley/qpasm"
license=('LGPL')
depends=("qt5-base")
provides=("qpasm")
source=("https://github.com/synio-wesley/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("ff1f806f92d87763fd818414f53e981b2f2a1b5b87dd76b152a48d82bf422a0a8501dd622ef140a548fab6de5c98583f0f0046d5848873b6ee8ada0deb8ebccd")

prepare() {
	cd "$pkgname-$pkgver"
	cd src

	qmake
}

build() {
	cd "$pkgname-$pkgver"
	cd src

	make -j $((`nproc`+1))
}

package() {
	# Desktop entry
	install -Dm 644 ./../qpasm.desktop "$pkgdir"/usr/share/applications/qpasm.desktop

	cd "$pkgname-$pkgver"
	# Binary
	install -Dm 755 ./src/qpasm "$pkgdir"/usr/bin/qpasm
	# Icon
	install -Dm 644 ./src/img/qpasm.png "$pkgdir"/usr/share/icons/qpasm.png
}
