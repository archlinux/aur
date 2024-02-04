# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-net-amazon-signature-v4
pkgver=0.21
pkgrel=1
pkgdesc='Implements the Amazon Web Services signature version 4, AWS4-HMAC-SHA256'
_dist=Net-Amazon-Signature-V4
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL PerlArtistic)
depends=(perl perl-uri)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/D/DB/DBOOK/$_dist-$pkgver.tar.gz")
sha256sums=(599cb766c055f6c48d362597e7535c902cd6674e4d6ad1ce4cb08e8d06777fd1)

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
