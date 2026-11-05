# Maintainer: Patrick <p.ziegler96 -_AT_- g m a i l -_Dot_- com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-font-freetype
pkgver=0.18
pkgrel=1
pkgdesc="read font files and render glyphs from Perl using FreeType2"
arch=('i686' 'x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('freetype2>=2.6.3' 'perl')
makedepends=()
checkdepends=('perl-test-warnings' 'perl-devel-checklib' 'perl-file-which')
url='https://metacpan.org/release/Font-FreeType'
_distdir="Font-FreeType-${pkgver}"
source=(https://cpan.metacpan.org/authors/id/D/DM/DMOL/Font-FreeType-${pkgver}.tar.gz)
b2sums=('39c3c809933199af3c26405ccae757d8c210642e76fb0c846c8cfaa46e410df5934eaee2e23913489daf1ff5de598445c9ce389a40c88f960c7e7c3a764961f8')

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
