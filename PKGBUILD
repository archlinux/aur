# Maintainer: Meatman jppjpp2954 [at] gmail [dot] com
pkgname=helical-cli-git
pkgver=r12.c8dfa3c
pkgrel=1
epoch=
pkgdesc="An helical representation of a solar system."
arch=('x86_64')
url="https://github.com/Nerter29/helical-cli"
license=('GPL-3.0-or-later')
groups=()
depends=('glibc')
makedepends=('git' 'zig')
checkdepends=()
optdepends=()
provides=('helical-cli')
conflicts=('helical-cli')
replaces=()
backup=()
options=()
install=
changelog=

source=("git+https://github.com/Nerter29/helical-cli.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/helical-cli"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/helical-cli"
	zig c++ -target x86_64-linux-gnu.2.17 \
		main.cpp body.cpp helical.cpp \
		-o helical -stdlib=libstdc++
}

package() {
	cd "$srcdir/helical-cli"
	install -Dm755 helical "$pkgdir/usr/bin/helical"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
