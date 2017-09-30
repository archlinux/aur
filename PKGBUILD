# Maintainer: awe00 < awe00 AT hotmail DOT fr>
pkgname=perl-package-generator
pkgver=1.106
pkgrel=1
pkgdesc='This packages the Foo-Bar distribution, containing the Foo::Bar module!'
_dist=Package-Generator
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=(perl-check-isa perl-term-size perl-class-isa perl-sort-naturally)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
md5sums=("SKIP")

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
