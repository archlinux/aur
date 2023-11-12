# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Net-DNS-Paranoid'
_modnamespace=Net
pkgname=perl-net-dns-paranoid
pkgver=0.08
pkgrel=2
pkgdesc="paranoid dns resolver"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-class-accessor-lite' 'perl-net-dns')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz"
        t-xip.io.patch)
sha256sums=('db359ba7c490405456db465e4d7ecb9622326d9b00e59a7914dbbb2bd554784a'
            '3a81e3143e74acee154f4b7572b838899499297be2bb3f080cb793a06de6e45a')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  patch -p1 -i "$srcdir"/t-xip.io.patch

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
