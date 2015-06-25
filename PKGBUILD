# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-web-scraper'
pkgver=0.38
pkgrel=1
pkgdesc='Web Scraping Toolkit using HTML and CSS Selectors or XPath expressions'
_dist='Web-Scraper'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8.1' 'perl-html-treebuilder-xpath>=0.08' 'perl-html-tree>=3.23' 'perl-yaml>=0' 'perl-libwww>=5.827' 'perl-scalar-list-utils>=0' 'perl-html-selector-xpath>=0.03' 'perl-uri>=0' 'perl-html-parser>=0' 'perl-html-tagset>=0' 'perl-xml-xpathengine>=0.08' 'perl-universal-require>=0')
checkdepends=()
makedepends=('perl-test-simple>=0' 'perl-extutils-makemaker>=6.59' 'perl-test-requires>=0' 'perl-test-base>=0' 'perl-module-build-tiny>=0.039')
provides=('perl-web-scraper-libxml=0.38' 'perl-web-scraper-filter=0.38')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/$_dist-$pkgver.tar.gz")
sha256sums=('f95b6e5f8d7feebe116d05bf59a2b7cf1a51ed9d30bca80123430ec4567543bf')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
)
