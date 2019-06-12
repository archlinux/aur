# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-text-simpletable-autowidth'
pkgver='0.09'
pkgrel='2'
pkgdesc="Simple eyecandy ASCII tables with auto-width selection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')

depends=(
  'perl'
  'perl-moo'
  'perl-text-simpletable'
)
checkdepens=()
makedepends=()
url='https://metacpan.org/pod/Text::SimpleTable::AutoWidth'
source=('https://cpan.metacpan.org/authors/id/C/CU/CUB/Text-SimpleTable-AutoWidth-0.09.tar.gz')
md5sums=('2ee9ee49bfcb8a2acd8516dfadb47d0e')
sha512sums=('b35d80ee1040ab744b53d29381034ea7ac67c5a6973516efda67b2ab34412bbadec6397d91a452488dd99158b2a4ee84115f3a52c12cb0e771f77fdc05cfb9ab')
_distdir="Text-SimpleTable-AutoWidth-0.09"

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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="-"
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
