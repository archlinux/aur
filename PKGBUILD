# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-dbix-class-schema-loader'
pkgver='0.07051'
pkgrel='1'
pkgdesc="Create a DBIx::Class::Schema based on a database"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-clan' 'perl-class-accessor-grouped>=0.10008' 'perl-class-c3-componentised>=1.0008' 'perl-class-inspector>=1.27' 'perl-class-unload>=0.07' 'perl-dbix-class>=0.08127' 'perl-data-dump>=1.06' 'perl-hash-merge>=0.12' 'perl-lingua-en-inflect-number>=1.1' 'perl-lingua-en-inflect-phrase>=0.15' 'perl-lingua-en-tagger>=0.23' 'perl-mro-compat>=0.09' 'perl-scope-guard>=0.20' 'perl-string-camelcase>=0.02' 'perl-string-toidentifier-en>=0.05' 'perl-try-tiny' 'perl-namespace-clean>=0.23' 'perl-curry')
makedepends=('perl-config-any' 'perl-config-general' 'perl-dbd-sqlite>=1.29' 'perl-moose>=1.12' 'perl-moosex-markasmethods>=0.13' 'perl-moosex-nonmoose>=0.25' 'perl-namespace-autoclean>=0.09')
checkdepends=('perl-test-deep>=0.107' 'perl-test-differences>=0.60' 'perl-test-exception>=0.31' 'perl-test-pod>=1.14' 'perl-test-warn>=0.21')
url='https://metacpan.org/dist/DBIx-Class-Schema-Loader'
source=('https://cpan.metacpan.org/authors/id/V/VE/VEESH/DBIx-Class-Schema-Loader-0.07051.tar.gz')
md5sums=('701d09a648f217fedf1dff2feee0d7de')
_distdir="DBIx-Class-Schema-Loader-0.07051"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
