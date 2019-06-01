# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-data-messagepack
pkgver=1.00
pkgrel=4
pkgdesc='MessagePack serializing/deserializing'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.8.1')
makedepends=('perl-extutils-parsexs>=3.18' perl-file-copy-recursive perl-module-install)
checkdepends=(perl-test-requires)
url=https://metacpan.org/release/Data-MessagePack
source=("http://search.cpan.org/CPAN/authors/id/S/SY/SYOHEX/Data-MessagePack-$pkgver.tar.gz")
md5sums=(a52f9d85cdaffe46bfb34a7b7da2ad92)
sha512sums=(4dbf9c8eb65b1f8c4f48ac97ffc39f6984c79eaf474445f052e8def5273b117ca2f43ccbf9792559691b3a4e4c3fb190a7c5b173ca9f3db390d4d3cc213324b1)
_ddir="Data-MessagePack-$pkgver"

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
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
