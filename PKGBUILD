# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-net-async-zmq
pkgver=0.002
pkgrel=1
pkgdesc='IO::Async support for ZeroMQ'
_dist=Net-Async-ZMQ
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-io-async' 'perl-module-load' 'perl-package-stash' 'perl-base' 'perl-if')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/Z/ZM/ZMUGHAL/$_dist-$pkgver.tar.gz")
sha256sums=('10a853b1fa8d2a193222fb25c34739836f60721c3f8f80aac45e0f75425593c1')

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
