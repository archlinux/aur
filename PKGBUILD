# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: Dirk Langer AKA ordoban <dirk.langer -_AT_- vvovgonik -_Dot_- de>

pkgname='perl-redis'
pkgver='1.991'
pkgrel='1'
pkgdesc="Perl binding for Redis database"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-timeout>=0.29' 'perl-io-string' 'perl-try-tiny' 'perl>=5.008')
makedepends=()
checkdepends=('perl-pod-coverage-trustpod' 'perl-test-cpan-meta' 'perl-test-deep' 'perl-test-fatal' 'perl-test-sharedfork' 'perl-test-tcp>=1.19')
url='https://metacpan.org/release/Redis'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMS/Redis-1.991.tar.gz' '04-pipeline.t.patch')
md5sums=('d7c494f1504da2d3273eb0c96a2d889b'
         '37228d6cf23949af136e7d7afe7d90db')
sha512sums=('28e4c5d4c4275a9949cc25f239c1f8bdd3371bd5f5772e72e6d4c063ce1cbfec77d429e6efcf3836a397d76eb9b7351ca98585ee5697f6bfbf359c200ace7819'
            '187a637c9f4bed4fcdc3a3552f64864735140857d2c57912727222fe6174bc982fcd6e91cc850ebd44538b57f81841eb29e4c40c67731918d69da2500fffa6a8')
_distdir="Redis-1.991"

prepare() {
  cd "$srcdir"
  patch -p0 -i "04-pipeline.t.patch"
}

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
