# Contributor: Nathaniel Clark <my full dot name at misrule dot us>

pkgname='perl-proc-guard'
pkgver='0.07'
pkgrel='1'
pkgdesc="process runner with RAII pattern"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-lite')
makedepends=('perl-module-build')
checkdepends=('perl-test-requires')
url='https://metacpan.org/pod/Proc::Guard'
source=("https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/Proc-Guard-$pkgver.tar.gz")
md5sums=('b5e369742f25302ae0075019987e3f68')
sha512sums=('1f27f7b1ee3116f3136cc4b310751bf0ab5f04a8698ce619cf94341c26e293f8c331126c636c6dd1dcc3b85724b60b22ea553b9c9f85624c59924dc89c2b6ac4')
_distdir="Proc-Guard-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    ./Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    ./Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  ./Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
