pkgname=perl-finance-quote-git
pkgver=v1.38.r12.gb8e1d58
pkgrel=1
pkgdesc='Perl/CPAN Module Finance::Quote : Fetch stock prices over the Internet'
arch=(any)
url='https://github.com/finance-quote/finance-quote'
license=('GPL' 'PerlArtistic')
depends=('perl-html-tree' 'perl-html-tableextract' 'perl-crypt-ssleay'
	 'perl-libwww' 'perl-date-calc' 'perl-json' 'perl-datetime' 'perl-cgi')
conflicts=('perl-finance-quote')
source=('git+https://github.com/finance-quote/finance-quote.git'
        'Makefile.PL')
md5sums=('SKIP'
         'fc0be335a2e4518094a09e787c095543')

pkgver() {
  cd "${srcdir}/finance-quote"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/finance-quote"
  cp "../Makefile.PL" .
}

build() {
  cd "${srcdir}/finance-quote"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/finance-quote"
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name ".packlist" -delete
  find ${pkgdir} -name "*.pod" -delete
}
