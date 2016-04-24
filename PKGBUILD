# Maintainer: Marcin Mielniczuk <marmistrz@inboxalias.com>
pkgname=arename
pkgver=4.0
pkgrel=3
pkgdesc="automatic audio file renaming tool"
arch=("any")
url="http://ft.bewatermyfriend.org/computer/arename.html"
depends=("perl-audio-scan" "perl-readonly")
source=("https://github.com/ft/$pkgname/archive/v$pkgver.zip")
sha1sums=("396bb6eb247f8e848fb22ecbc8c7cfa28656e95e")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make genperlscripts
	make doc
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir"/usr
	make install prefix="$pkgdir"/usr libpath=share/perl5/site_perl
	make install-doc prefix="$pkgdir"/usr
}

# Commands present in the Ubuntu packaging, but I'm not sure if we should execute them
dummy() {
	$(RM) "$pkgdir"/usr/share/doc/arename/CHANGES
	$(RM) "$pkgdir"/usr/share/doc/arename/LICENCE
	$(RM) "$pkgdir"/usr/share/doc/arename/README
	$(RM) "$pkgdir"/usr/share/doc/arename/*.html
}
