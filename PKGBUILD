# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-build'
pkgver='0.026'
pkgrel='1'
pkgdesc="A modern module builder, author tools not included!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-requirements-dynamic' 'perl-extutils-builder>=0' 'perl-extutils-builder-compiler>=0.035' 'perl-extutils-config>=0' 'perl-extutils-helpers>=0.028' 'perl-extutils-installpaths>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Dist-Build'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Dist-Build-$pkgver.tar.gz")
md5sums=('a1a8ffd7fd2450f9f5f6b7f67132a441')
sha512sums=('8bfbaf85a2a51fdc4a3a953a8ed57b778bdc915a671e01388c1edc456c37fef41faae6d5d6b90826b511fcd2659da5897d75f7545144577d6d960af337f0ea31')
_distdir="Dist-Build-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
