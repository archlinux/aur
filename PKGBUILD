# Maintainer: Peter Tirsek <peter@tirsek.com>

pkgname=perl-pod-markdown
pkgver=3.101
pkgrel=1
pkgdesc='Convert POD to Markdown'
_dist=Pod-Markdown
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.8.0')
checkdepends=('perl-test-differences')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/R/RW/RWSTAUNER/${_dist}-${pkgver}.tar.gz")
sha256sums=("e8ff6b6c170576966adf20d4024e005f75dbe73242386a1d03600e1626e9f040")

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
