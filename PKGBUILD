# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-build'
pkgver='0.024'
pkgrel='1'
pkgdesc="A modern module builder, author tools not included!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-requirements-dynamic' 'perl-extutils-builder>=0' 'perl-extutils-builder-compiler>=0.028' 'perl-extutils-config>=0' 'perl-extutils-helpers>=0.028' 'perl-extutils-installpaths>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Dist-Build'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Dist-Build-$pkgver.tar.gz")
md5sums=('2bfdffba20a09e939b30d96d1fdba635')
sha512sums=('425809725d753ab8fa3e03a2a70f887693c79c16b82ac3fe8f4f7a3059a459c655bb621e12702bfec9effbf12412e8294d23f00f63c9b92753a472bdeaa7515a')
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
