# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname='ninka'
pkgver='1.1'
pkgrel='4'
pkgdesc='a license identification tool for Source Code'
arch=('any')
url="http://$pkgname.turingmachine.org"
license=('AGPL3')
depends=('perl')
source=(
	"http://$pkgname.turingmachine.org/download/$pkgname-$pkgver.tar.bz2"
	"$pkgname"
)
md5sums=(
	'097b736781d4121128af3c1bbd66dd82'
	'e3cf63e90c3b215a61ba8643f39e02c7'
)

build() { 
    cd "$srcdir/$pkgname-$pkgver";

	cd comments && make
}

package() { 
    cd "$srcdir/$pkgname-$pkgver";

	install -Dm755 -t "$pkgdir/usr/bin" '../ninka' 'comments/comments'
	install -Dm755 -t "$pkgdir/usr/bin" '../ninka' 'comments/comments'

	install -Dm755 -t "$pkgdir/usr/lib/$pkgname" 'ninka.pl'

	install -Dm755 -t "$pkgdir/usr/lib/$pkgname/extComments" extComments/*.pl

	install -Dm755 -t "$pkgdir/usr/lib/$pkgname/filter" filter/*.pl
	install -Dm644 -t "$pkgdir/usr/lib/$pkgname/filter" filter/*.dict

	install -Dm755 -t "$pkgdir/usr/lib/$pkgname/matcher" matcher/*.pl
	install -Dm644 -t "$pkgdir/usr/lib/$pkgname/matcher" matcher/*.dict

	install -Dm755 -t "$pkgdir/usr/lib/$pkgname/senttok" senttok/*.pl
	install -Dm644 -t "$pkgdir/usr/lib/$pkgname/senttok" senttok/*.dict

	install -Dm755 -t "$pkgdir/usr/lib/$pkgname/splitter" splitter/*.pl
	install -Dm644 -t "$pkgdir/usr/lib/$pkgname/splitter" splitter/*.dict
	install -Dm644 -t "$pkgdir/usr/lib/$pkgname/splitter" splitter/*.abv

	install -Dm644 -t "$pkgdir/usr/share/man/man1" */*.1

	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" 'README.TXT' 'ChangeLog'
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/comments" comments/{README,CHANGES}
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/splitter" 'splitter/README'
}
