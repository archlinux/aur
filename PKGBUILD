# Maintainer: Babz <babz+aur@tfnux.org>

pkgname=ricochet-irc
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="Ricochet bridge for IRC"
arch=('any')
url="https://github.com/adraenwan/ricochet-irc"
license=('BSD')
groups=()
depends=('qt5-base' 'qt5-declarative' 'protobuf' 'tor')
makedepends=('qt5-tools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$pkgname-$pkgver::git+https://github.com/adraenwan/ricochet-irc#tag=$pkgver"
	"ricochet-irc.service"
)
noextract=()
sha256sums=(
	'SKIP'
	'6140077bfbf75eae190d221c77f5c540d98fff188b0839a21919d29107763af7'
)
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	git submodule update --init --recursive
}

build() {
	cd "$pkgname-$pkgver"

	mkdir -p build
	cd build

	qmake PROTOBUFDIR=/usr/include/google/ ../src/
	make
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	install -D -m 644 ricochet-irc.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service

	cd "$pkgname-$pkgver"
	install -D -m 755 build/release/irc/ricochet-irc ${pkgdir}/usr/bin/${pkgname}
}
