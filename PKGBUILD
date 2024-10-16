# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-moox-strictconstructor'
pkgver='0.012'
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
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/MooX-StrictConstructor-$pkgver.tar.gz")
md5sums=('237e663327e67e1bc87b18c51a2df2e1')
sha512sums=('06147a01d67f1f08777eb1799dadcb7a64de4f951c469f782e6a3b07e75d83665ea48bfed3864d3a274a0a49d1d402e1936d4195bc3e4e5f7d6c68760fee3330')
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
