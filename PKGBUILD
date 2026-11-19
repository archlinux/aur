# Maintainer: Elias Elwyn <a@jthvai.net>

pkgname=perl-alien-sqlite
_dist=Alien-sqlite
pkgver=1.09
pkgrel=1
pkgdesc='Compile the Sqlite library'

url="https://metacpan.org/dist/$_dist"
_author=SLAFFAN
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('f0a3cbf26d900aadcf16c5bf5071703a03117b57e6a650a20d153e9ca73ae47a')

arch=(any)
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
  perl
  perl-alien-build
  perl-file-find-rule
  perl-pkgconfig
  perl-sort-versions
)
checkdepends=(
  perl-ffi-checklib
)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
