# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Alad Wenter <alad at archlinux dot org>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Jonathas Rodrigues

pkgname=perl-orlite
_dist=ORLite
pkgver=2.00
pkgrel=1
pkgdesc='ORLite - Extremely light weight SQLite-specific ORM'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=ETHER
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('dd4bc23ab4c87c5096a406aaa03c75e2f9e48f858c7283d84cff8af24b82defa')

arch=(any)
depends=(
  perl
  perl-dbd-sqlite
  perl-dbi
  perl-file-remove
  perl-params-util
)
checkdepends=(
  perl-class-xsaccessor
  perl-test-script
  perl-test-deep
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
