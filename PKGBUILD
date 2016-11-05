# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributor: Baptiste Grenier <baptiste@bapt.name>

pkgname=fortune-mod-fr
pkgver=0.02
pkgrel=5
pkgdesc="Collection of French fortune cookie files"
arch=('any')
url="http://www.fortunes-fr.org"
license=('custom')
depends=('fortune-mod')
groups=('fortune-mods')
source=("http://www.fortunes-fr.org/fortunes-fr/fortunes-fr-$pkgver.tar.gz")
md5sums=('07c2a2d56853bb02d8b48f31a0c6bf6e')

build() {
	cd "$srcdir/fortunes-fr-$pkgver"

# Check if the system is in UTF-8
	if [[ ${LANG,,} == *utf-8* ]]; then
	  ./configure --prefix=/usr --with-fortunesdir=/usr/share/fortune/fr --with-charset=UTF8
  	else
	  ./configure --prefix=/usr --with-fortunesdir=/usr/share/fortune/fr
	fi

	make
}

package() {
	cd "$srcdir/fortunes-fr-$pkgver"
	make DESTDIR="$pkgdir" install
	install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
