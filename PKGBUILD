# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Elias Elwyn <a@jthv.ai>

pkgname=perl-pod2-base
pkgver=0.043
pkgrel=2
pkgdesc='Base module for translations of Perl documentation'
_dist=POD2-Base
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL PerlArtistic)
depends=(perl)
checkdepends=(perl-test-pod perl-test-pod-coverage)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/F/FE/FERREIRA/$_dist-$pkgver.tar.gz")
sha256sums=(071910a2233d11767c9576f1909b8686b4696acb6a7035d1513f9c15ccf0237e)

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
