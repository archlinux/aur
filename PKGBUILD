# Maintainer: awe00 < awe00 AT hotmail DOT fr>
pkgname=perl-asciio
pkgver=1.51.3
pkgrel=2
pkgdesc='It has always been painful to do ASCII diagrams by hand. This perl application allows you to draw ASCII diagrams in a modern (but simple) graphical interface.'
_dist=App-Asciio
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl gtk2-perl perl-file-slurp perl-readonly perl-module-util perl-data-compare perl-text-diff perl-treedumper perl-compress-bzip2 perl-list-moreutils perl-eval-context perl-hash-slice perl-data-treedumper-renderer-gtk perl-clone)
makedepends=('perl-module-build' perl-test-most)
checkdepends=(perl-carp-clan)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/N/NK/NKH/$_dist-$pkgver.tar.gz")
md5sums=("2ad2baddc9cb1dac4189990e1bb220e5")

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
