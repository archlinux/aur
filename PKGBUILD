# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-finance-quote
pkgver=1.55
pkgrel=2
pkgdesc="Perl/CPAN Module Finance::Quote : Fetch stock prices over the Internet"
arch=(any)
url="https://search.cpan.org/dist/Finance-Quote/"
license=("GPL" "PerlArtistic")
depends=("perl-html-tree" "perl-html-tableextract" "perl-crypt-ssleay"
	 "perl-libwww" "perl-date-calc" "perl-json" "perl-datetime" "perl-cgi"
	 "perl-text-template" "perl-datetime-format-strptime"
	 "perl-json-parse" "perl-string-util" "perl-mozilla-ca")
source=("https://search.cpan.org/CPAN/authors/id/B/BP/BPSCHUCK/Finance-Quote-${pkgver%00}.tar.gz")
sha256sums=('e2e000b67c66b6af50d4761858492110510a55a030a891017d40c7de218b748f')

build() {
  cd "$srcdir"/Finance-Quote-${pkgver%00}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Finance-Quote-${pkgver%00}
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
