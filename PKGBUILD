# Maintainer:
# Contributor: orumin <dev@orum.in>

_pkgname="perl-x11-guitest"
pkgname="$_pkgname"
pkgver=0.28
pkgrel=4
pkgdesc="Provides GUI testing/interaction routines"
url='https://metacpan.org/release/X11-GUITest'
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'perl'
  'libx11'
  'libxtst'
)
makedepends=(
  'libxt'
)

options=('!emptydirs')

_pkgsrc="X11-GUITest-$pkgver"
source=("http://search.cpan.org/CPAN/authors/id/C/CT/CTRONDLP/$_pkgsrc.tar.gz")
sha256sums=('dceede53700610fff142dc9d5c4e4cd0370c88a4f2b1371f9cbf4d8d8ce6f64b')

build() {
  export PERL_MM_USE_DEFAULT=1
  export PERL5LIB=""
  export PERL_AUTOINSTALL=--skipdeps
  export PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"
  export PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"
  export MODULEBUILDRC=/dev/null

  cd "$_pkgsrc"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$_pkgsrc"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$_pkgsrc"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
