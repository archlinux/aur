# Maintainer: Aaron Liu <aaronliu0130 at gmail dot com>
pkgname=perl-acme-cow
pkgver=0.2.1
pkgrel=2
pkgdesc='Acme_Perfect Perl support for cowsay cowfiles'
_dist=Acme-Cow
arch=('any')
url="https://metacpan.org/pod/Acme::Cow"
license=('Artistic-2.0')
depends=('perl' 'perl-text-template')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/H/HA/HADFL/$_dist-$pkgver.tar.gz")
sha256sums=(1da3037d254ebb58d391549300677f6bcadaf08c3bc52d8ccd07cdeec7fc03d4)

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
