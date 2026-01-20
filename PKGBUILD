# Maintainer : Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-git-repository
pkgver=1.326
pkgrel=1
pkgdesc="Perl interface to Git repositories"
_dist=Git-Repository
arch=('any')
options=(purge '!emptydirs')
url="https://metacpan.org/release/$_dist"

# From README: This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

depends=(
  'perl'
  'perl-git-version-compare'
  'perl-system-command'
  'perl-namespace-clean'
)
checkdepends=(
  'git'
  'perl-test-requires-git'
)

source=(
  "https://cpan.metacpan.org/authors/id/B/BO/BOOK/$_dist-$pkgver.tar.gz"
)
sha256sums=(
  '04497d2592f8f811bc66f4e32f6da8fe443086f8c27b8ba7bce395bf82f0f9fb'
)

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
