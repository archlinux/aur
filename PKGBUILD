# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-string-ttylength
pkgver=0.03
pkgrel=1
pkgdesc='length or width of string excluding ANSI tty codes'
_dist=String-TtyLength
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-exporter' 'perl-parent' 'perl-unicode-eastasianwidth')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/$_dist-$pkgver.tar.gz")
sha256sums=('4fedaf72028511d80eb6afba523993e9aaa245d7af558345d5d4ed46e2e82ce1')

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
