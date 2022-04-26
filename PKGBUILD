# Contributor: Nathaniel Clark <my full dot name at misrule dot us>

pkgname='perl-ex-monkeypatched'
pkgver='0.03'
pkgrel='1'
pkgdesc="Experimental API for safe monkey-patching"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-name')
makedepends=()
url='https://metacpan.org/pod/Sub::Name'
source=("https://cpan.metacpan.org/authors/id/A/AR/ARC/ex-monkeypatched-$pkgver.tar.gz")
md5sums=('ace33fd3954f24d3d9b8512626c0ede8')
sha512sums=('8cd864dccd9c7ab39090171ef7e86d359d40d9c04f7b7f3912aff367322b5e17816d50f39f680f344c75a2c5673bad74fdd9257e8f18ad61b2884c6ca3190825')
_distdir="ex-monkeypatched-$pkgver"

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
