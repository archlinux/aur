# CPAN Name  : HTML::Lint
# Contributor: Ordoban <dirk.langer@vvovgonik.de>

pkgname=perl-html-lint
_pkgname='HTML-Lint'
pkgver=2.27
pkgrel=2
_extraversion='_03'
pkgdesc="Perl module to check for HTML errors in a string or file"
arch=("any")
url="http://search.cpan.org/dist/HTML-Lint"
license=("PerlArtistic")
depends=("perl>=5.6.2" "perl-html-parser>=3.47" "perl-html-tagset>=3.03")
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}${_extraversion}.tar.gz)
options=(!emptydirs)
md5sums=("33a491a879a711c0172d92deccf5a25f")
sha512sum=("28367a5318861be3842f26048b59b3623a31acc91539e7e2617a1cf9a750b35ad8d901bfc43ff688c1ac63cf1ebd4607f16b59b49e4b3a22853027863e7b8667")

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
