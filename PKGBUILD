# Contributor: Wei Huang <grubbyfans@gmail.com>
pkgname=perl-pgtop
pkgver=0.11
pkgrel=1
pkgdesc='This packages the pgtop perl utility'
_dist=pgtop
arch=('any')
url="https://metacpan.org/release/COSIMO/$_dist-$pkgver"
license=()
depends=(perl perl-dbi perl-term-readkey perl-dbd-pg perl-json)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/C/CO/COSIMO/$_dist-$pkgver.tar.gz")
md5sums=(073f460b0ce250dab1439c6806d19f29)

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