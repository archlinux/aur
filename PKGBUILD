# CPAN Name  : HTML::Lint
# Contributor: Ordoban <dirk.langer@vvovgonik.de>

pkgname=perl-html-lint
_pkgname='HTML-Lint'
pkgver=2.30
pkgrel=1
_extraversion=''
pkgdesc="Perl module to check for HTML errors in a string or file"
arch=("any")
url="http://search.cpan.org/dist/HTML-Lint"
license=("PerlArtistic")
depends=("perl>=5.6.2" "perl-html-parser>=3.47" "perl-html-tagset>=3.03")
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}${_extraversion}.tar.gz)
options=(!emptydirs)
md5sums=("236b8035dd89bf7495ab5863b7328550")
sha512sum=("33f670962d08ff852651339c3b570016e7a9a892e0f3b9657a33e2cdc71d7852ad98aa3c492562bfde0453d793545deaf1deca6baf2505dc83300dd3c61b0fb6")

build() {
  cd "$srcdir/${_pkgname}-${pkgver}${_extraversion}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
  PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
  PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
  PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
  MODULEBUILDRC=/dev/null
  perl Makefile.PL
  make
}

check() {
  cd "$srcdir/${_pkgname}-${pkgver}${_extraversion}"
  make test
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}${_extraversion}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
