# Maintainer: Linus Probert <linus.probert@gmail.com>
pkgname=blightmud
pkgver=5.5.3
pkgrel=1
epoch=
pkgdesc="A terminal mud client written in rust"
arch=('x86_64' 'i686')
url="https://github.com/blightmud/blightmud"
license=('GPL')
groups=()
depends=('gcc-libs' 'openssl' 'alsa-lib')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=('blightmud')
conflicts=('blightmud')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/Blightmud/Blightmud/archive/v$pkgver.tar.gz")
md5sums=('c13dc67c553afb14f8e05918297a2a59')

prepare() {
	mv Blightmud-$pkgver $pkgname-$pkgver
}

build() {
	cd $pkgname-$pkgver
	cargo build --release --locked --target-dir=target
}

package() {
	cd $pkgname-$pkgver
	install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/blightmud" "$pkgdir/usr/bin/blightmud"
	install -D -m644 "resources/lua/types/blightmud.d.lua" "$pkgdir/usr/share/blightmud/lua/types/blightmud.d.lua"
	install -D -m644 "resources/lua/types/luarc.json" "$pkgdir/usr/share/blightmud/luarc.json"
}
