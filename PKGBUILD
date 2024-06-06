# Maintainer: Elias Elwyn <a@jthv.ai>
# Contributor: "Jameson Pugh <imntreal@gmail.com>"
# Contributor: Alessandro Sagratini <ale_sagra at hotmail dot com>

pkgname=perl-net-sftp-foreign
pkgver=1.93
pkgrel=2
pkgdesc='SSH File Transfer Protocol client using the native SSH client'
_dist=Net-SFTP-Foreign
arch=(any)
url="https://metacpan.org/release/$_dist"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=(perl openssh)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/S/SA/SALVA/$_dist-$pkgver.tar.gz")
sha256sums=('6c7d64250876873da434800e5060a8bef7a46451d81f817e37e43cfda51a0f7a')

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
