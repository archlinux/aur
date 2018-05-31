# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=pikalogy
pkgver=1
pkgrel=3
pkgdesc="Pikachu theme for Terminology"
arch=('x86_64')
_COMMIT_HASH=62a4ee8417cfbb00f70c6be79bfd39539b5108b0
url="https://github.com/jeanguyomarch/pikalogy"
license=('MIT')
depends=('terminology')
makedepends=('efl')
source=("https://github.com/jeanguyomarch/pikalogy/archive/${_COMMIT_HASH}.tar.gz")
sha512sums=('9a485306e3ec4a2c262a2060a09db28fc0aa81eb805dda0343b81c81e8ff2c4cd0386ebab1054b4186cb1f0da48c399ac9c69563e30c0d9c767640d326ee23c9')

prepare() {
	cd "$pkgname-$_COMMIT_HASH"
	sed -i 's/\$(PREFIX)/$(DESTDIR)\/usr/' Makefile
	sed -i '30c\\tmkdir -p "$(DESTDIR)/usr/share/terminology/themes"' Makefile
}

build() {
	cd "$pkgname-$_COMMIT_HASH"
	make DEFINITIONS="-DWITH_SOUND"
}

package() {
	cd "$pkgname-$_COMMIT_HASH"
	make DESTDIR="$pkgdir/" install
}
