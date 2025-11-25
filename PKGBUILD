# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-build'
pkgver='0.021'
pkgrel='1'
pkgdesc="A modern module builder, author tools not included!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-requirements-dynamic' 'perl-extutils-builder>=0' 'perl-extutils-builder-compiler>=0.028' 'perl-extutils-config>=0' 'perl-extutils-hascompiler>=0.024' 'perl-extutils-helpers>=0.028' 'perl-extutils-installpaths>=0' 'perl-file-sharedir-tiny>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Dist-Build'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Dist-Build-$pkgver.tar.gz")
md5sums=('160448f6a6c06cc1bdf8c5a5d5625a31')
sha512sums=('407251cfd76eea475202fd937754f8828808805fcf5244477403c9397ac05b26b2d470e3a24d4983a225f541ddde0cdc447aee62e79bcb86fa0d34c4c635afc7')
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
