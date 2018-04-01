# Maintainer: osch <oliver at luced de>
pkgname=luajack
pkgver=0.5
pkgrel=2
epoch=
pkgdesc="Lua bindings for the JACK Audio Connection Kit"
arch=('x86_64')
url="https://github.com/stetre/luajack"
license=('MIT')
groups=()
depends=('lua'
         'jack')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/stetre/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install

	install -d            "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"

	install -d                  "$pkgdir`pkg-config --variable=INSTALL_LMOD lua`/luajack"
	install -m644 luajack/*.lua "$pkgdir`pkg-config --variable=INSTALL_LMOD lua`/luajack"

	cd "$pkgdir/usr/lib/"
	ln -sfv lua/5.3/luajack.so libluajack.so
}
md5sums=('4266aafb424e1a337ee7ad2cb13ec25a')
