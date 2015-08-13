pkgname=php-igbinary-git
_extname=igbinary
pkgver=1.1.0.r65.g9e5fdb6
pkgrel=1
pkgdesc="Igbinary is a drop in replacement for the standard php serializer."
arch=(any)
url='https://github.com/igbinary/igbinary/'
license=(BSD)
makedepends=(php git)
source=("${pkgname}::git+https://github.com/igbinary/igbinary.git")
sha256sums=('SKIP')
backup=("etc/php/conf.d/$_extname.ini")

pkgver() {
   cd "$srcdir/$pkgname"
   git describe --long | sed 's/\([^-]*-g\)/r\1/;y/-/./'
}

build() {
	cd "$srcdir/$pkgname"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	echo ";extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D "modules/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}
