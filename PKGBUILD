# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-slack-webhook
pkgver=0.003
pkgrel=1
pkgdesc='Slack WebHook with preset layout & colors for sending slack notifications (via MetaCPAN distribution)'
_dist=Slack-WebHook
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-json-xs' 'perl-simple-accessor')
makedepends=('perl-test2-tools-explain' 'perl-test2-plugin-nowarnings' 'perl-test-mockmodule')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/$_dist-$pkgver.tar.gz")
sha256sums=(8056195fc956b276aaafb7c8627fdac91ac5ba19bd1fb21f36b70e70aeb2a0a3)

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

