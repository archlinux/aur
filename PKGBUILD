# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-module-compile'
pkgver='0.35'
pkgrel='1'
pkgdesc="Perl Module Compilation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha1>=2.13')
makedepends=()
url='https://metacpan.org/release/Module-Compile'
source=('http://search.cpan.org/CPAN/authors/id/I/IN/INGY/Module-Compile-0.35.tar.gz')
md5sums=('7b9cf30692ab350d2ac013db55d9bc34')
sha512sums=('4115277ffb0da033c6c7fea6480c7245c8b5eb151378081fefaef35761b92a4218d56e8e1e9a4892ce78a379592336badefa2de56062d9e5b7024cdc35d3e46b')
_distdir="Module-Compile-0.35"

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
