# Contributor: Nathaniel Clark <my full dot name at misrule dot us>

pkgname='perl-array-utils'
pkgver='0.5'
pkgrel='1'
pkgdesc="small utils for array manipulation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/pod/Array::Utils'
source=("https://cpan.metacpan.org/authors/id/Z/ZM/ZMIJ/Array/Array-Utils-$pkgver.tar.gz")
md5sums=('ac15e6dce2c7c9d1855ecab9eb00aee6')
sha512sums=('2761533f97412eb03f2dd1117b9de1a8278afe1b589dd9041630a03c11212049b804d8efa90caf28aa7a2098771669c55861f45dd3054f0d5654f0976f909a49')
_distdir="Array-Utils-$pkgver"

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
