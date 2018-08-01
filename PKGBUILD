# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-version-compare
pkgver=0.14
pkgrel=2
pkgdesc='Compare version strings'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/Version-Compare
source=("http://search.cpan.org/CPAN/authors/id/T/TE/TEX/Version-Compare-$pkgver.tar.gz")
md5sums=(a8caccfb723d76de3ac9a80d27a45511)
sha512sums=(53ec2f04fe847818a84d9f6465bae04aeb93e7d4e4cf58fa62bc893e0f482f637aeb2b0df8e1798c2b00749c569421a8cb6c02fe7a770333a8a927e7d90a7302)
_ddir="Version-Compare-$pkgver"

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
