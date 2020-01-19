# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=perl-test-requires-git
pkgver=1.008
pkgrel=1
pkgdesc='Check test requirements against the available version of Git'
_dist=Test-Requires-Git
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-git-version-compare)
options=(purge '!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOOK/$_dist-$pkgver.tar.gz")
md5sums=('65ff93a1eadfc1984ce3bf3b1f2a417d')
sha256sums=('70916210970d84d7491451159ab8b67e15251c8c0dae7c3df6c8d88542ea42a6')

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
