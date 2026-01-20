# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-build'
pkgver='0.023'
pkgrel='1'
pkgdesc="A modern module builder, author tools not included!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-requirements-dynamic' 'perl-extutils-builder>=0' 'perl-extutils-builder-compiler>=0.028' 'perl-extutils-config>=0' 'perl-extutils-helpers>=0.028' 'perl-extutils-installpaths>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Dist-Build'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Dist-Build-$pkgver.tar.gz")
md5sums=('d395734a3dba03cf90296cc88bf1cc52')
sha512sums=('b307e474ceaa9fcedb53a7da808e18850bbb2bd678b8c59fb391295f4f02d92762a0a7cac138ad06b9c600a3d95ff2750b054579ed513a7da2935e1f5437cc78')
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
