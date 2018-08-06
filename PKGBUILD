# Contributor: Daniel Café <dccafe@gmail.com>
pkgname=perl-quota
pkgver=1.7.2
pkgrel=2
pkgdesc='Quota - Perl interface to file system quotas'
_dist=Quota
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'libtirpc' 'rpcsvc-proto')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOMZO/$_dist-$pkgver.tar.gz")
md5sums=(d4ed0acc56ece4e5080a7a6d827e9c66)

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  sed -i 's/-shared/-ltirpc -shared/g' Makefile
  sed -i 's/usr\/local\/include/usr\/include\/tirpc/g' Makefile
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
