# Maintainer : Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-git-repository
pkgver=1.325
pkgrel=1
pkgdesc="Perl interface to Git repositories"
_dist=Git-Repository
arch=('any')
license=('PerlArtistic' 'GPL')
options=(purge '!emptydirs')
depends=(perl perl-git-version-compare perl-system-command perl-namespace-clean)
checkdepends=(git perl-test-requires-git)
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/B/BO/BOOK/$_dist-$pkgver.tar.gz")
md5sums=('34979454fb75e50810458cde7313d920')
sha256sums=('9b2a4fa194f4a0eb452355d0c808727e5e9c16c145ac7d24c3ea96d0abefed43')

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
