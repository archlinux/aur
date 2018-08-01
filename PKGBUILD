# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-log-any-adapter-log4perl
pkgver=0.08
pkgrel=3
pkgdesc='Log::Any adapter for Log::Log4perl'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-log-any 'perl-log-log4perl>=1.32')
checkdepends=(perl-log-any)
url=https://metacpan.org/release/Log-Any-Adapter-Log4perl
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Log-Any-Adapter-Log4perl-$pkgver.tar.gz")
md5sums=(2313296a3f04e16dd7b974edb12fa2ce)
sha512sums=(6522aa87a9a5d6c81f77b9415e25919d031fd588c1eb73a8e50aa1c3e43f5226d3c4589b6d89d03ef06b347f40e07ce83a0db5461aed5625f028a6d64fb6c343)
_ddir="Log-Any-Adapter-Log4perl-$pkgver"

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
