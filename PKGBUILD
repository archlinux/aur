# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_perlmod='Test-Name-FromLine'
_modnamespace=Test
pkgname=perl-test-name-fromline
pkgver=0.13
pkgrel=2
pkgdesc="Auto fill test names from caller line"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl' 'perl-file-slurp' 'perl-test-differences' 'perl-test-fatal')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('cee6cc18f6f46f37fe4437130bad4e740df79818683f13f922763c0e9c5c6378')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  ./Build test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  ./Build install --installdirs=vendor --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
