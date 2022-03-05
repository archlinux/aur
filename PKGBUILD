# Maintainer: Shreyas Minocha <shreyas[at]shreyasminocha[dot]me>

pkgname=hunspell-hi
pkgver=2.1.1
pkgrel=1
pkgdesc='Hindi dictionary for Hunspell'
arch=('any')
url='https://github.com/Shreeshrii/hindi-hunspell'
license=('GPL3')
depends=('hunspell')
source=("$pkgname-$pkgver.zip::https://github.com/Shreeshrii/hindi-hunspell/archive/refs/tags/v$pkgver.zip")
md5sums=('22a9510c77cffb60ef86e79506db1358')

package() {
	cd "$srcdir/hindi-hunspell-$pkgver"

	install -dm755 "$pkgdir/usr/share/hunspell"
	install -m644 Hindi/hi_IN.aff "$pkgdir/usr/share/hunspell"
	install -m644 Hindi/hi_IN.dic "$pkgdir/usr/share/hunspell"

	install -dm755 "$pkgdir/usr/share/myspell/dicts"
	pushd "$pkgdir/usr/share/myspell/dicts"
	for file in "$pkgdir"/usr/share/hunspell/*; do
		ln -sv /usr/share/hunspell/$(basename $file) .
	done
	popd
}
