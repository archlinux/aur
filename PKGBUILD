# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=bibledit
pkgdesc='Linux desktop client relase of bibledit for translating the Bible'
pkgver=1.0.348
pkgrel=0.1
arch=('any')
url='https://bibledit.org/'
license=('GPL3')
source=("http://bibledit.org/linux/$pkgname-$pkgver.tar.gz")
sha256sums=('43367f64a3c14f2e51227758ee63b2bf6ffe68a8fb3e8a731acf018a1cfbe997')
depends=('sword' 'sqlite' 'gtk3' 'cairo' 'at-spi2-atk')

build () {
	cd "$pkgname-$pkgver"
    ./configure --enable-client --enable-paratext
    make -j8
}

package () {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"

	# Documentation and examples
	for file in README NEWS; do
		install -Dm644 "$file" \
			"$pkgdir/usr/share/doc/$pkgname/$file"
	done

	# License
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
