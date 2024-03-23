# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=perl-filehandle-unget
_dist=FileHandle-Unget
pkgver=0.1634
pkgrel=3
pkgdesc='FileHandle which supports multi-byte unget'
arch=(any)
url="http://search.cpan.org/dist/$_dist"
license=(GPL-2.0-only)
depends=(perl)
checkdepends=(perl-test-compile perl-file-slurper perl-universal-require)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::http://cpan.perl.org/modules/by-module/${_dist%-*}/$_dist-$pkgver.tar.gz")
b2sums=('b7f4993e1247ac5b80828ba56137acde6660576934d42abb9628ef4afbd82b69849a95670625ce56044c12636fc81b5aab4297135b17cc4af2f4651beabaff4a')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
