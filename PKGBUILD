# Maintainer: osch <oliver at luced de>
pkgname=luaexif
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Lua binding for libexif"
arch=('x86_64')
url="https://github.com/minoki/luaexif"
license=('MIT')
groups=()
depends=('lua'
         'libexif')
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/minoki/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make CFLAGS="-fPIC `pkg-config --cflags lua` `pkg-config --cflag libexif`" \
	     LDFLAGS="-shared `pkg-config --libs lua` `pkg-config --libs libexif`"
}

package() {
	cd "$pkgname-$pkgver"

	install -d      "$pkgdir`pkg-config --variable=INSTALL_CMOD lua`"
	install exif.so "$pkgdir`pkg-config --variable=INSTALL_CMOD lua`/exif.so"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname"
}
md5sums=('69b7b411634f6f5b91dd297f96e98ec7')
