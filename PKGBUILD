# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-uri-query'
pkgver='0.16'
pkgrel='1'
pkgdesc="class providing URI query string manipulation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')

depends=(
  'perl'
  'perl-clone'
  'perl-uri'
)
checkdepens=()
makedepends=()
url='https://metacpan.org/pod/URI::Query'
source=('https://cpan.metacpan.org/authors/id/G/GA/GAVINC/URI-Query-0.16.tar.gz')
md5sums=('0f219d21b94320e2a7696b8f67fc9c14')
sha512sums=('fd355e55051533b5c47833f7009801b3e3c54cc82c2821ab4a77b390468ed5b92bb0e1d99ea516754c8c5dc67fa2ee967c0cf9094b1920d774fc48c6f87f54a2')
_distdir="URI-Query-0.16"

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
