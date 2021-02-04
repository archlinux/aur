# Maintainer: Mark Grimes <mgrimes at peculier.com>

pkgname=perl-regexp-grammars
pkgver=1.057
pkgrel=1
pkgdesc="Perl/CPAN Module Regexp::Grammars - Add grammatical parsing features to Perl regexes"
_dist=Regexp-Grammars
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10' 'perl-b-hooks-parser')
options=('!emptydirs' purge)
source=(https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/$_dist-$pkgver.tar.gz)
md5sums=('6713a82c633c7c1f121c70b435146f5b')

# Setup environment to ensure installation in system perl and vender directory
clean_env() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null PERL_AUTOINSTALL=--skipdeps
}

build() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

