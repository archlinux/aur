# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-build'
pkgver='0.028'
pkgrel='2'
pkgdesc="A modern module builder, author tools not included!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-requirements-dynamic' 'perl-extutils-builder>=0' 'perl-extutils-builder-compiler>=0.035' 'perl-extutils-config>=0' 'perl-extutils-helpers>=0.028' 'perl-extutils-installpaths>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/pod/Dist::Build'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Dist-Build-$pkgver.tar.gz")
md5sums=('2493608d110ac9686c87a8cf1f2b5529')
sha512sums=('ab09070a3be39f040bdfbf3d35525fff859e92365a3b9002c2cf56547630842f9bb3983bc35c29458b8ea86301504f61d12aba0c421fcd2df35dd49e49a35f27')
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
