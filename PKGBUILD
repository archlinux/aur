# Contributor: Mateusz Krasowski <matkras@gmail.com>
# Contributor: Luigi ranghetti <ggranga@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-autovivification'
pkgver='0.15'
pkgrel='1'
pkgdesc="Lexically disable autovivification."
arch=('i686' 'x86_64' 'armv7h')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.3')
makedepends=()
url='http://search.cpan.org/dist/autovivification'
source=("http://www.cpan.org/authors/id/V/VP/VPIT/autovivification-$pkgver.tar.gz")
md5sums=('5f2120f1591f5b0600b1a927bfc51e55')
_distdir="autovivification-$pkgver"

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
