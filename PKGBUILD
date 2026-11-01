# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-number-format
_dist=Number-Format
pkgver=1.79
pkgrel=1
pkgdesc='Perl extension for formatting numbers'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('404b231709b28a41024ae76bedd349145da7e535f94c6013b6bb55eea383e1ad')

arch=(any)
depends=(perl)
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
