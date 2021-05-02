# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-vars'
pkgver='0.015'
pkgrel=1
pkgdesc="Detects unused variables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-build-tiny')
url='https://metacpan.org/pod/Test::Vars'
source=("https://cpan.metacpan.org/authors/id/G/GF/GFUJI/Test-Vars-$pkgver.tar.gz")
sha256sums=('e18dd158272e4ec9939e1dfb33c7431ab4e75c6b40b280c38b5e804fda471a54')
_distdir="Test-Vars-$pkgver"

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
  rm t/03_warned.t  # due to https://github.com/houseabsolute/p5-Test-Vars/issues/37
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
