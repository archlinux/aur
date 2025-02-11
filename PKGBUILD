# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-markdown-pod
pkgver=0.008
pkgrel=1
pkgdesc='convert Markdown text to Pod'
_dist=Markdown-Pod
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-getopt-long' 'perl-scalar-list-utils' 'perl-markdent' 'perl-moose' 'perl-moosex-params-validate'
	'perl-moosex-semiaffordanceaccessor' 'perl-moosex-strictconstructor' 'perl-text-table-tiny'
	'perl-constant' 'perl-namespace-autoclean')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/K/KE/KEEDI/$_dist-$pkgver.tar.gz")
sha256sums=('1f0940fee8455bf0c723f8b9d430e1a97be854fb6330957746c54d6ee73688ef')

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

