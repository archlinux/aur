# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: chimeracoder <dev@chimeracoder.net>

pkgname='perl-ppi'
pkgver='1.236'
pkgrel='1'
pkgdesc="Parse, Analyze and Manipulate Perl (without perl)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0.30' 'perl-io-string>=1.07' 'perl-list-moreutils>=0.16' 'perl-params-util>=1.00' 'perl-task-weaken' 'perl>=5.6.0')
makedepends=('perl-class-inspector>=1.22' 'perl-file-remove>=1.42')
checkdepends=('perl-test-nowarnings>=0.084' 'perl-test-object>=0.07' 'perl-test-subcalls>=1.07' 'perl-test-deep')
url='http://search.mcpan.org/dist/PPI'
source=("http://search.mcpan.org/CPAN/authors/id/M/MI/MITHALDU/PPI-${pkgver}.tar.gz")
sha512sums=('93a7f4059b12156bdcba77958c17841ab43d85cb0045d0c58d087d6e637e09e253a559cfe465d9d8699329098582759cb8381978c121b9661a9a755e919dece1')
_distdir="PPI-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd $_distdir
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd $_distdir
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd $_distdir
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
