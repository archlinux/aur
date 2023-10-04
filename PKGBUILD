# Contributor: Your Name <youremail@domain.example>
pkgname=perl-simple-accessor
pkgver=1.13
pkgrel=1
pkgdesc='very simple, light and powerful accessor (via MetaCPAN distribution)'
_dist=Simple-Accessor
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/$_dist-$pkgver.tar.gz")
sha256sums=(5af6066c7a9f58ab963e36d12052bcc5b20e80ee32f3899ea882a79192882226)

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

