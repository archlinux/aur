# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-db-object
pkgver="0.818"
pkgrel='1'
pkgdesc="Extensible, high performance object-relational mapper (ORM)"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-DB-Object/"
depends=('perl-bit-vector' 'perl-clone>=0.29' 'perl-datetime' 'perl-dbi>=1.40' 'perl-list-moreutils' 'perl-rose-datetime>=0.532' 'perl-rose-db>=0.763' 'perl-rose-object>=0.854' 'perl-time-clock>=1.00')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/J/JS/JSIRACUSA/Rose-DB-Object-${pkgver}.tar.gz")
md5sums=('3510587804272b9d714ae4f9b7dd6b47')
sha512sums=('2d76eedcea68d19ac889afdc0b81635a230b3bf83e5e047a001f0017ecfe8b82e464f0892b3945754ba46fa63348ec52395a1ab21553580a2440148a210bbe29')

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
