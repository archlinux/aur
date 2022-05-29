# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-log-any-adapter-log4perl
pkgver=0.09
pkgrel=5
pkgdesc='Log::Any adapter for Log::Log4perl'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-log-any 'perl-log-log4perl>=1.32')
checkdepends=(perl-log-any)
url=https://metacpan.org/release/Log-Any-Adapter-Log4perl
source=("https://search.cpan.org/CPAN/authors/id/P/PR/PREACTION/Log-Any-Adapter-Log4perl-$pkgver.tar.gz")
md5sums=(33f58745a229cfbe5558fd75aeddf6b4)
sha512sums=(7b7e0d20e8280be7e741676216e37ef9d480c82e874f22495055b29a365951f3f20d76a27a5a1ab9ee22e93a31bead0b2e09063375284c5342fa0694ccc83114)
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
