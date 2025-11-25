# Maintainer: tarball <bootctl@gmail.com>

pkgname=papersway
pkgver=2.003
pkgrel=1
pkgdesc='PaperWM-like scrollable tiling window management for Sway/i3wm'
arch=('any')
url='https://metacpan.org/dist/App-papersway'
license=('GPL-3.0-only')
depends=(
  'bash'
  'perl'
  'perl-anyevent'
  'perl-anyevent-i3'
  'perl-json'
)

source=("https://cpan.metacpan.org/authors/id/S/SP/SPWHITTON/App-papersway-$pkgver.tar.gz")
sha256sums=('ff2d25d94f8c0dd41bd21320bc0c2aa9cf69d89a3f51483d7e8cf936aa22d092')

build() {
  cd App-papersway-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd App-papersway-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd App-papersway-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
