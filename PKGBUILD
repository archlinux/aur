# CPAN Name  : HTML::Lint
# Contributor: Ordoban <dirk.langer@vvovgonik.de>

pkgname=perl-html-lint
_pkgname='HTML-Lint'
pkgver=2.27
pkgrel=1
_extraversion='_02'
pkgdesc="Perl module to check for HTML errors in a string or file"
arch=("any")
url="http://search.cpan.org/dist/HTML-Lint"
license=("PerlArtistic")
depends=("perl>=5.6.2" "perl-html-parser>=3.47" "perl-html-tagset>=3.03")
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}${_extraversion}.tar.gz)
options=(!emptydirs)
md5sums=("275cb06e93b8b0b2723f703438cb5460")
sha512sum=("d931af3b2d5aad5b937b637a3b248b0748386c4eb91153bff45bd8a1a2facb75c5d8103902b848d52ed570d2294a48570716897e09a6462995b93d7563fd4188")

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
