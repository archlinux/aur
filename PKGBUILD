# Maintainer: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-alpm
pkgver=3.01
pkgrel=3
pkgdesc='ArchLinux Package Manager backend library.'
arch=(i686 x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/ALPM
source=("http://search.cpan.org/CPAN/authors/id/J/JU/JUSTER/ALPM-$pkgver.tar.gz")
md5sums=(1f5804d33ba93afddaf88a020cd9e71a)
sha512sums=(823e444c0e124d9be0ab4d806590fe40e434db24ad29f18c55a476e47d09896ff85c1ab8c420821d39d223b93c4acb08ca521ac1d29a8c22c4174a898909d55a)
_ddir=ALPM-3.01

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
