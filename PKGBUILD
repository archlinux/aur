# Maintainer: Dirk Langer <dirk.langer@vvovgonik.de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-hook-lexwrap'
pkgver='0.26'
pkgrel='1'
pkgdesc="Lexically scoped subroutine wrappers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Hook-LexWrap'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Hook-LexWrap-0.26.tar.gz')
md5sums=('5d022159b0c56d48d04ef9334309b488')
sha512sums=('f7771d4fb8379f43fa5b864e345f4526603914c3c486c637ea07fb9e2d41569bf40948a9039fab7d10c683fb85e16a8653876613903d34cc6801fcc9e92aa58b')
_distdir="Hook-LexWrap-0.26"

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
