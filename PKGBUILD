# Maintainer : Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
pkgname=perl-redisdb-parser
pkgver=2.23
pkgrel=1
pkgdesc='Redis protocol parser for RedisDB)'
_dist=RedisDB-Parser
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-try-tiny)
makedepends=(perl-test-failwarnings perl-test-most)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/Z/ZW/ZWON/$_dist-$pkgver.tar.gz")
md5sums=(5450e8a63cd16647c12147d45debe579)

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
