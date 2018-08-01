# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-function-parameters
pkgver=2.000007
pkgrel=5
pkgdesc='define functions and methods with parameter lists ("subroutine signatures")'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.14.0')
checkdepends=(perl-dir-self perl-test-fatal)
url=https://metacpan.org/release/Function-Parameters
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MAUKE/Function-Parameters-$pkgver.tar.gz")
md5sums=(4821f970b428c199802b38049565ff24)
sha512sums=(3776e5324f1c78a6d96d86a6c223e29ad6298db105338a7e2de513101eddede19732031a5c7b46e3ccb0935275334ca6ea5779d5acb5501a5de7edb9692aa4dc)
_ddir="Function-Parameters-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
