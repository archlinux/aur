# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-db-object
pkgver="0.815"
pkgrel="1"
pkgdesc="Extensible, high performance object-relational mapper (ORM)"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-DB-Object/"
depends=('perl-bit-vector' 'perl-clone>=0.29' 'perl-datetime' 'perl-dbi>=1.40' 'perl-list-moreutils' 'perl-rose-datetime>=0.532' 'perl-rose-db>=0.763' 'perl-rose-object>=0.854' 'perl-time-clock>=1.00')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/J/JS/JSIRACUSA/Rose-DB-Object-${pkgver}.tar.gz")
md5sums=('fd6a2fbdc3bc72601d349fd707d41feb')
sha512sums=('ea6a482edf4b303a9d044d253e4072ced361a07f6b2a7cabccfd6d388344d85627b5122b5a5f9a01a34978320abbc9ae1f6a42ce0013c9711531fea806123289')

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
