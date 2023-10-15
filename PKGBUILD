#Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=perl-devel-camelcadedb
pkgver=2023.1
pkgrel=1
pkgdesc='Perl side of the Perl debugger for IntelliJ IDEA and other JetBrains IDE'
_dist=Devel-Camelcadedb
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('MIT')
depends=('perl-hash-storediterator>=0' 'perl-json-xs>=3.02' 'perl-padwalker>=2.2' 'perl>=5.008')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/H/HU/HURRICUP/$_dist-v$pkgver.tar.gz")
sha256sums=('cff8d24e5945e3944debf213995a6b155b91e5813469156b13d5acf35f6a5d9f')

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
