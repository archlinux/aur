# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

_distname=Perl-Critic
pkgname=perl-critic
pkgver=1.132
pkgrel=1
pkgdesc="Critique Perl source code for best-practices."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
# https://github.com/Perl-Critic/Perl-Critic/blob/dev/inc/Perl/Critic/BuildUtilities.pm
depends=(
  'perl-module-build'
  'perl-b-keywords>=1.05'
  'perl-config-tiny'
  'perl-exception-class>=1.23'
  'perl-file-homedir'
  'perl-file-which'
  'perl-io-string'
  'perl-list-moreutils>=0.19'
  'perl-module-pluggable>=3.1'
  'perl-ppi>=1.224'
  'perl-ppix-quotelike'
  'perl-ppix-regexp>=0.027'
  'perl-ppix-utilities>=1.001'
  'perl-tidy'
  'perl-pod-spell'
  'perl-readonly>=2.00'
  'perl-string-format>=1.13'
  'perl-task-weaken'
)
makedepends=()
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/Perl-Critic'
source=("https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/$_distname-$pkgver.tar.gz")
sha512sums=('489d551b4913071a9001e8476425079b3aeef44838feff622edfdb64ca09f62b569f5338d2e1982d3ccd3fdb8f30caf077ceac5ec1beebafbde7a01d6deed890')

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
