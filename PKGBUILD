# Maintainer : Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
pkgname=perl-uri-redis
pkgver=0.02
pkgrel=1
pkgdesc='URI for Redis connection info'
_dist=URI-redis
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-uri)
makedepends=(perl-test-most perl-module-install)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/M/ME/MENDEL/$_dist-$pkgver.tar.gz")
md5sums=(ed86ee5019e5e038ee9d8f727a0972e9)

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
