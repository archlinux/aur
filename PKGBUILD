# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-zmq-ffi
pkgver=1.19
pkgrel=1
pkgdesc='version agnostic Perl bindings for zeromq using ffi'
_dist=ZMQ-FFI
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-carp' 'perl-class-xsaccessor' 'perl-exporter' 'perl-ffi-checklib' 'perl-ffi-platypus' 'perl-import-into'
	'perl-math-bigint' 'perl-moo' 'perl-scalar-list-utils' 'perl-sub-exporter' 'perl-try-tiny' 'perl-if'
	'perl-namespace-clean' 'perl-threads')
checkdepends=('perl-anyevent' 'perl-sys-sigaction')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/G/GH/GHENRY/$_dist-$pkgver.tar.gz")
sha256sums=('dc68f9407e58a23f79aa5254941f11204e5386fb1a6c1def412f9448f723b24f')

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
