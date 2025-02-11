# Maintainer: dringsim <dringsim@qq.com> 
pkgname=perl-markdent
pkgver=0.40
pkgrel=1
pkgdesc='An event-based Markdown parser toolkit'
_dist=Markdent
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-digest-sha' 'perl-encode' 'perl-exporter' 'perl-file-slurper' 'perl-getopt-long-descriptive' 'perl-html-parser'
	'perl-io' 'perl-list-allutils' 'perl-module-runtime' 'perl-moose' 'perl-moosex-getopt' 'perl-moosex-role-parameterized'
	'perl-moosex-semiaffordanceaccessor'  'perl-moosex-strictconstructor' 'perl-params-validationcompiler' 'perl-scalar-list-utils'
	'perl-specio' 'perl-tree-simple' 'perl-try-tiny' 'perl-base' 'perl-namespace-autoclean' 'perl-parent')
makedepends=('perl-module-build')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/$_dist-$pkgver.tar.gz")
sha256sums=('9e503a2626a4c610d76fbf38871c5f496b166e29c34d8d88d2a27e15c63861bd')

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

