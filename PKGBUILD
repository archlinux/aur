# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-module-compile'
pkgver='0.38'
pkgrel='3'
pkgdesc="Perl Module Compilation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha1>=2.13' 'perl-capture-tiny')
makedepends=()
url='https://metacpan.org/release/Module-Compile'
source=("http://search.cpan.org/CPAN/authors/id/I/IN/INGY/Module-Compile-${pkgver}.tar.gz")
md5sums=('b51c0b2ebc169b2290d4c4d40fbd6206')
sha512sums=('50f17cf6e88f9834d69944e64a46b2ca260824220cf09fe962c29dd36a8d0cdd7a2d59c7e0cf360a7fb506252cdea3b13b99437e443735b35c7a713a0bea1f31')
_distdir="Module-Compile-${pkgver}"

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
