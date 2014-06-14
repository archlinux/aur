# Maintainer: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-alpm
pkgver=3.02
pkgrel=1
pkgdesc='ArchLinux Package Manager backend library.'
arch=(i686 x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/ALPM
source=("http://search.cpan.org/CPAN/authors/id/J/JU/JUSTER/ALPM-$pkgver.tar.gz")
md5sums=(5723e681dd40200488d77f83df41df62)
sha512sums=(dc7858b49d731f0d25beb35050f2425908e1560d1a9514b12081b24fba58fb5293ece129aded36c0550031177c0c53eaeacec075216f2091c5c82b15a2cfafe9)
_ddir=ALPM-3.02

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
