# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=bibledit
pkgdesc='Editory for translating the Bible (Cloud release)'
pkgver=5.0.813
pkgrel=1
arch=('any')
url='https://bibledit.org/'
license=('GPL3')
source=("https://github.com/bibledit/cloud/releases/download/5.0.813/$pkgname-$pkgver.tar.gz")
sha256sums=('3a5612c761a1ca4cd37d159a16d2ab68094c00c150ca099a84d045c4e93bd932')
depends=('sword' 'sqlite' 'gtk3' 'cairo' 'at-spi2-atk')
makedepends=('mimetic')

build () {
	cd "$pkgname-$pkgver"
    ./configure --enable-client --enable-paratext
    make
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
