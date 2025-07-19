# CPAN Name  : HTML::Lint
# Contributor: Ordoban <dirk.langer@vvovgonik.de>

pkgname=perl-html-lint
_pkgname='HTML-Lint'
pkgver=2.32
pkgrel=4
_extraversion=''
pkgdesc="Perl module to check for HTML errors in a string or file"
arch=("any")
url="http://search.cpan.org/dist/HTML-Lint"
license=("Artistic-2.0")
depends=("perl>=5.6.2" "perl-html-parser>=3.47" "perl-html-tagset>=3.03")
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}${_extraversion}.tar.gz)
options=(!emptydirs)
md5sums=("8e8f7d84af7a1d85b66af966c14c6855")
sha512sum=("b943b1734b5fd9eeb6ad82ef0f7e17ad6721f5e4dae23ed3fb077a3cdeacd019aa6efe7659396cd199bd803d8b1729d75766fa81095969b2219d87cd554d7cef")

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
