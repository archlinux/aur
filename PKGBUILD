# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-db-object
pkgver="0.819"
pkgrel='1'
pkgdesc="Extensible, high performance object-relational mapper (ORM)"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-DB-Object/"
depends=('perl-bit-vector' 'perl-clone>=0.29' 'perl-datetime' 'perl-dbi>=1.40' 'perl-list-moreutils' 'perl-rose-datetime>=0.532' 'perl-rose-db>=0.763' 'perl-rose-object>=0.854' 'perl-time-clock>=1.00')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/J/JS/JSIRACUSA/Rose-DB-Object-${pkgver}.tar.gz")
md5sums=('9ec8c93e3a944f4b8ac69ca380401078')
sha512sums=('52bc2520e59016baa792e66f5ad89bd9081f8f6071c1c4e4d45605eda0b50d3f5467ea7440575c24925b70e0a24eea826ad9be9e22a0532c39a189b39ebfa8a7')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Rose-DB-Object-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
