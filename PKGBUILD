# Maintainer: izzint <izz@int.moe>
pkgname=audacious-discord-rpc
pkgver=2.4
pkgrel=1
pkgdesc="Discord Rich Presence for Audacious"
arch=('x86_64')
url="https://github.com/onegen-dev/audacious-discord-rpc"
licence=('MIT')
depends=('audacious' 'curl' 'libstdc++' 'glibc')
makedepends=('git' 'cmake' 'ninja')
provides=($pkgname)
source=("$pkgname::git+${url}.git#tag=v${pkgver}")
sha256sums=('b18f62dc552a671b23b6d01db4917a5552b10c7ae0d2c71eb27849635f596156')

build() {
	cd "$srcdir"
	cmake -S "$pkgname" -B build \
	-GNinja \
	-DCMAKE_BUILD_TYPE=Release

	cmake --build build -j
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
