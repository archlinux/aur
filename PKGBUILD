# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-locale-maketext-lexicon-dbi'
_pkgname='Locale-Maketext-Lexicon-DBI'
pkgver=0.2.1
pkgrel=2
pkgdesc='Locale::Maketext::Lexicon::DBI - Database based lexicon fetcher/parser'
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/dist/Locale-Maketext-Lexicon-DBI/"
options=(!emptydirs)

depends=('perl' 'perl-locale-maketext-lexicon')
makedepends=('perl')

provides=('locale-maketext-lexicon-dbi=0.2.1' 'Locale::Maketext::Lexicon::DBI=0.2.1' 'perl-locale-maketext-lexicon-dbi=0.2.1')

source=("http://search.cpan.org/CPAN/authors/id/M/MD/MDIETRICH/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('736c288de239f6e06366c8bca6fce431')
sha512sums=('d438528d80306bc3bb07489702d631c9fbe952164ac8e2efeeaccf5a7d85fc11211d0e1688cf53473efe71766a3012812c62856eece513b9f4a4374eae4058e4')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-v${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
