# Maintainer:
# Contributor: orumin <dev@orum.in>

_pkgname="perl-x11-guitest"
pkgname="$_pkgname"
pkgver=0.29
pkgrel=1
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
source=("https://cpan.metacpan.org/authors/id/C/CT/CTRONDLP/$_pkgsrc.tar.gz")
sha256sums=('59f78085e48f7b0400cfcf82617de0f4c87514273951573fbe733b491befc5c5')

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
