# Maintainer: John Regan <john@jrjrtech.com>
pkgname=perl-meta
pkgver=0.012
pkgrel=1
pkgdesc='perl meta-programming API'
_dist=meta
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl-module-build')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_dist}-${pkgver}.tar.gz")
md5sums=('0946e65cca5f929c6210d2ee28b6287c')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}

