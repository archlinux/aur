# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-net-amazon-signature-v4
_dist=Net-Amazon-Signature-V4
pkgver=0.22
pkgrel=2
pkgdesc='Implements the Amazon Web Services signature version 4, AWS4-HMAC-SHA256'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/D/DB/DBOOK/$_dist-$pkgver.tar.gz")
sha256sums=('522fea266c8b31a6c3de7e3be5db715972038714a0239bfbbe1fccad4d065cfe')

arch=(any)
depends=(perl perl-uri)
checkdepends=(perl-file-slurper perl-http-message)
options=('!emptydirs')

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
