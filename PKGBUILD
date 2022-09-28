# Maintainer: camb

pkgname=perl-test-lib
pkgver=0.003
pkgrel=1
pkgdesc='Use libraries from a t/lib directory'
_dist='Test-Lib'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.6')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/$_dist-$pkgver.tar.gz")
md5sums=('ecdd194c01de50db318be960ad05fce6')
sha256sums=('d84b48d92567cba3d0afb1e8175aab836bfa8a838e19ac9080cabc2e3f9dc9f5')
sha512sums=('f7c8aca697d07fe05bac38c8dd509eed32ea5698d4d449af73106ba0b0a17e297396aa656097e8e1027c9254e890b1a5d9da75e62fa888ecd52d74caa5f7e718')

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
