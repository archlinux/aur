# Contributor: Nathaniel Clark <my full dot name at misrule dot us>

pkgname='perl-test-skip-unlessexistsexecutable'
pkgver='0.041'
pkgrel='1'
pkgdesc="skips tests unless executable exists"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-install')
url='https://metacpan.org/pod/Test::Skip::UnlessExistsExecutable'
source=("https://cpan.metacpan.org/authors/id/K/KI/KITANO/Test-Skip-UnlessExistsExecutable-$pkgver.tar.gz")
md5sums=('70f9ade8966b33217f8572d4cef88a13')
sha512sums=('a91dd74030853b994c4ac75a6cc676a224e7a41772a11b4079fe4079ebbd40b0c4d83e9d92d6e65955e0f0e39e29407561fca4718911295343fe89198508f6bc')
_distdir="Test-Skip-UnlessExistsExecutable-$pkgver"

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
