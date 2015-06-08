# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-class-dbi-sweet'
_pkgname='Class-DBI-Sweet'
pkgver='0.11'
pkgrel='2'
pkgdesc='Class::DBI::Sweet - Making sweet things sweeter'
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
url='http://search.cpan.org/dist/Class-DBI-Sweet'
options=('!emptydirs')

depends=('perl' 'perl-class-dbi' 'perl-data-page' 'perl-sql-abstract')
makedepends=('perl')

provides=('class-dbi-sweet=0.11' 'Class::DBI::Sweet=0.11' 'perl-class-dbi-sweet=0.11')

source=("http://search.cpan.org/CPAN/authors/id/P/PH/PHRED/${_pkgname}-${pkgver}.tar.gz")
md5sums=('c593a4138242f7b7601b90356bdf3a13')
sha512sums=('82965b4be422d178773cff8235eef1ecde90010bbafe53b7ae23bb706bc4f0162682b12c0c0fb4303842055a7ab76eb4447e8e7afe14769110488d8c93955481')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
