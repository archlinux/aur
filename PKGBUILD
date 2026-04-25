# Maintainer: tarball <bootctl@gmail.com>

pkgname=papersway
pkgver=3.000
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
sha256sums=('eb41fbcc2b556c17d83aa54ac3d5f512338cee6ce34ae3e3e48c1c0d6842f9d1')

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
