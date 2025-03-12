# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-dbix-log4perl'
pkgver='0.26'
pkgrel='6'
pkgdesc="Extension for DBI to log via Log::Log4perl"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-dbi>=1.5' 'perl-log-log4perl>=1.04')
url='https://metacpan.org/dist/DBIx-Log4perl'
source=("https://cpan.metacpan.org/authors/id/M/MJ/MJEVANS/DBIx-Log4perl-${pkgver}.tar.gz")
md5sums=('9dfdc96ba79a2353e98fe6f90d9c5098')
sha512sums=('a2286778d98506ffce612b9dca0f4d699baeb6ac3ebe91ec5f52e16805dc507c6f2d4a560a7c526af3cdd0e2a17c790fbcc0de16ca231e8d3f9a54f415216fd2')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/DBIx-Log4perl-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
