# Maintainer : Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
pkgname=perl-redisdb
pkgver=2.57
pkgrel=1
pkgdesc='Perl extension to access redis database (RedisDB)'
_dist=RedisDB
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-redisdb-parser perl-try-tiny perl-uri-redis)
makedepends=(perl-test-failwarnings perl-test-tcp)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/Z/ZW/ZWON/$_dist-$pkgver.tar.gz")
md5sums=(fb1e1561180b06a6faabab835a422224)

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
