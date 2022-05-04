# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-plack-test-agent'
pkgver='1.5'
pkgrel='1'
pkgdesc="OO interface for testing low-level Plack/PSGI apps"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  'perl'
  'perl-http-message'
  'perl-plack'
  'perl-test-tcp'
  'perl-test-www-mechanize'
)
checkdepends=(
  'perl'
  'perl-http-cookies'
  'perl-http-server-simple-psgi'
  'perl-modern-perl'
  'perl-plack'
  'perl-test-memory-cycle'
  'perl-test-simple'
  'perl-test-requires'
)
makedepends=()
url='https://metacpan.org/pod/Plack::Test::Agent'
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/Plack-Test-Agent-$pkgver.tar.gz")
md5sums=('4d33d920db3939e6a7cee934141f8af2')
sha512sums=('bc618d7c6f7dccdb889314da7282fb1aeb5c7cef63bc69fa0fed154d2053796ecad17eb7328c5a712326d6d15b012edeac66468cffae7f8094f87916672a5f27')
_distdir="Plack-Test-Agent-$pkgver"

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
