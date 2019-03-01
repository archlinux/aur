#Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=perl-devel-camelcadedb
pkgver=2019.1
pkgrel=1
pkgdesc='Perl side of the Perl debugger for IntelliJ IDEA and other JetBrains IDE'
_dist=Devel-Camelcadedb
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('MIT')
depends=('perl-hash-storediterator>=0' 'perl-json-xs>=3.02' 'perl-padwalker>=2.2' 'perl>=5.008')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HU/HURRICUP/$_dist-v$pkgver.tar.gz")

build() {
  cd "$srcdir/$_dist-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

sha256sums=('91cd5d51384559b6821fc61768341f57443208a871461902a400d449c0e53f94')
