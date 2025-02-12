# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-ffi-platypus
pkgver=2.10
pkgrel=1
pkgdesc='Write Perl bindings to non-Perl libraries with FFI. No XS required.'
_dist=FFI-Platypus
arch=('x86_64')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('libffi' 'perl-capture-tiny' 'perl-extutils-makemaker' 'perl-ffi-checklib' 'perl-pathtools' 'perl-ipc-cmd'
	'perl-json-pp' 'perl-scalar-list-utils' 'perl-autodie' 'perl-constant' 'perl-parent')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_dist-$pkgver.tar.gz")
sha256sums=('67115c02317b23d119b6ee1a5e6d5f26faf8985943eb53cf8862c5719e78fb6f')

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
