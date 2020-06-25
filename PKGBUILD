# Contributor: Daniel Müllner <daniel@danifold.net>
pkgname=perl-bytes-random-secure
pkgver=0.29
pkgrel=6
pkgdesc='Perl extension to generate cryptographically-secure random bytes.'
_dist=Bytes-Random-Secure
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-math-random-isaac perl-crypt-random-seed)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAVIDO/$_dist-$pkgver.tar.gz")
sha256sums=(53bbd339e6a11efca07c619a615c7c188a68bb2be849a1cb7efc3dd4d9ae85ae)

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
