# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-text-table-tiny
pkgver=1.03
pkgrel=1
pkgdesc='generate simple text tables from 2D arrays'
_dist=Text-Table-Tiny
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-carp' 'perl-exporter' 'perl-ref-util' 'perl-string-ttylength' 'perl-parent')
checkdepends=('perl-test-fatal')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/$_dist-$pkgver.tar.gz")
sha256sums=(0b5a8c2678f79e99694055684f55f134b5fffb7ae5f0016a4e48661403c6de5e)

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
