# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-mason-plugin-psgihandler
pkgver=0.06
pkgrel=2
pkgdesc='PSGI handler for Mason'
_dist=Mason-Plugin-PSGIHandler
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
makedepends=('perl-file-sharedir-install')
checkdepends=('perl-test-longstring')
depends=('perl' 'perl-mason' 'perl-plack' 'perl-file-sharedir' 'perl-try-tiny' 'perl-devel-stacktrace')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/J/JS/JSWARTZ/$_dist-$pkgver.tar.gz")
sha256sums=(ffde514fa5514aae39a8969b209bae3b05ac9bf584ff310a5c17194d4887db93)
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

