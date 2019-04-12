# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-moox-strictconstructor'
pkgver='0.010'
pkgrel='1'
pkgdesc='Make your Moo-based object constructors blow up on unknown attributes.'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-moo')
makedepends=()
checkdepends=()
url='https://metacpan.org/pod/MooX::StrictConstructor'
source=('https://cpan.metacpan.org/authors/id/H/HA/HARTZELL/MooX-StrictConstructor-0.010.tar.gz')
md5sums=('d4a71e6e874bf8dfb6cb1856f6a37b8f')
sha512sums=('17748ee05c1679d3cbade89b40a6f884bafc45244298f1dfcc5441dc81ab807394e6aafce483e302da8441ccb954aa1c7438b4449fcc373ecdcf81ad9e7cd864')
_distdir="MooX-StrictConstructor-0.010"

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
