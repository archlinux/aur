# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-moox-strictconstructor'
pkgver='0.011'
pkgrel='1'
pkgdesc='Make your Moo-based object constructors blow up on unknown attributes.'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  'perl'
  'perl-moo'
  'perl-strictures'
)
makedepends=()
checkdepends=()
url='https://metacpan.org/pod/MooX::StrictConstructor'
source=("https://cpan.metacpan.org/authors/id/H/HA/HARTZELL/MooX-StrictConstructor-$pkgver.tar.gz")
md5sums=('a1e81b0f2362b8f8d1d59c78f3f89455')
sha512sums=('9f977795ae3c746b8dd65573b8cc8ea69c8fcb13a8cc6725069bcf2479b96ea2954d5531a7c92189c5523218a9e66e431f510956472248c5f0795d952ee58eb1')
_distdir="MooX-StrictConstructor-$pkgver"

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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
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
