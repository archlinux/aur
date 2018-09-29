# Maintainer: Ward Segers <w@rdsegers.be>
pkgname=qpasm
pkgver=1.2
pkgrel=1
kgdesc="pseudo-assembler interpreter"
arch=("x86_64")
url="https://github.com/synio-wesley/qpasm"
license=('LGPL')
depends=("qt4")
provides=("qpasm")
source=("https://github.com/synio-wesley/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("8504d51310390a2efb9b7e5d0fd1984b8471beda09ce9c16d0bd3639364ddec0f2e1a74ccec10fff975aa0754ddb77b8b1d33c08f5c3c7f083b20f567cc056cf")

prepare() {
	cd "$pkgname-$pkgver"
	cd src

	qmake-qt4
}

build() {
	cd "$pkgname-$pkgver"
	cd src

	make -j $((`nproc`+1))
}

package() {
	# Desktop entry
	install -Dm 644 ./../qpasm.desktop "$pkgdir"/usr/share/applications/qpas.desktop

	cd "$pkgname-$pkgver"
	# Binary
	install -Dm 755 ./src/qpasm "$pkgdir"/usr/bin/qpasm
	# Icon
	install -Dm 644 ./src/img/qpasm.png "$pkgdir"/usr/share/icons/qpasm.png
}
