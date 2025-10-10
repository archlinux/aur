# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-alien-build-plugin-cleanse-builddir
_dist=Alien-Build-Plugin-Cleanse-BuildDir
pkgver=0.06
pkgrel=6
pkgdesc='Alien::Build plugin to cleanse the build dir after the build phase'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/S/SL/SLAFFAN/$_dist-$pkgver.tar.gz")
sha256sums=('e0290b4891a18068db109c3001c6c8f1c900a28568dcaaa78d4dd0b69216d666')

arch=(any)
depends=(
  perl
  perl-alien-build
  perl-path-tiny
)
checkdepends=(
  perl-capture-tiny
  perl-data-dump
)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
