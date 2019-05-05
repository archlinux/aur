# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname=Test-Perl-Critic
pkgname=perl-test-perl-critic
pkgver=1.04
pkgrel=2
pkgdesc="Use Perl::Critic in test programs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mce>=1.827' 'perl-perl-critic>=1.105')
makedepends=()
url='https://metacpan.org/release/Test-Perl-Critic'
source=("https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/$_distname-$pkgver.tar.gz")
sha512sums=('bb4d0c671c927e849b24d97feb4c95bb612f5975af165650065d5fdbe2584a48cd8fc39dd14f8ab1a0e75e7ab067a86504f1b3729cdc43dc87bfb146fe526fbb')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distname-$pkgver"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distname-$pkgver"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
