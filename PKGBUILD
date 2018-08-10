# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-vars'
pkgver='0.014'
pkgrel='1'
pkgdesc="Detects unused variables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-build-tiny')
url='http://search.cpan.org/dist/Test-Vars'
source=('https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Test-Vars-0.014.tar.gz')
md5sums=('8aec7213ad746761000530b6a79432af')
sha512sums=('25361ab010c5d991e3f955fbc2956fb52c5a31801fbc742b4d7eb02fd56d71eee4314cb515ece8c3fc76ab88bdee4304ccc0762d7f7360bdfd05b05c51ac6314')
_distdir="Test-Vars-0.014"

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
