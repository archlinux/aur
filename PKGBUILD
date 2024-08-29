# Maintainer: <none>
# Contributor: tarball <bootctl@gmail.com>

pkgname=papersway
pkgver=1.002
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
sha256sums=('4b0cfa25a61fb9d9a24c0e84d0ddaf2d61683055cee6f0ec05c99e2fdf9efb4c')

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
