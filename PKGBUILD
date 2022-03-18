# Contributor: Your Name <youremail@domain.com>
pkgname=perl-pass-otp
pkgver=1.5
pkgrel=1
pkgdesc='Perl implementation of HOTP/TOTP algorithms'
_dist=Pass-OTP
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-convert-base32 perl-digest-hmac)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/J/JB/JBAIER/$_dist-$pkgver.tar.gz")
sha256sums=('1ae8f1c26bdf497300b17ecb46223b43d620b289484e878545811501814979a3')

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
