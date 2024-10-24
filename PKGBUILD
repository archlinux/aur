# Maintainer: tarball <bootctl@gmail.com>

pkgname=papersway
pkgver=1.004
pkgrel=1
pkgdesc='PaperWM-like scrollable tiling window management for Sway/i3wm'
arch=('any')
url='https://metacpan.org/dist/App-papersway'
license=('GPL-3.0-only')
depends=(
  'bash'
  'perl'
  'perl-anyevent'
  'perl-anyevent-i3>=0.19'
  'perl-json'
)

source=("https://cpan.metacpan.org/authors/id/S/SP/SPWHITTON/App-papersway-$pkgver.tar.gz")
sha256sums=('fd12d200cd2d244995973343913088b4d6505c66f5867965997bc4bf1821e10a')

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
