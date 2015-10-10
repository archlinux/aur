# Maintainer: Maxim Polishchuck <mpolishchuck@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_perlmod=Carton
pkgname=perl-carton
pkgver=1.0.12
pkgrel=2
pkgdesc='Perl module dependency manager (aka Bundler for Perl)'
arch=('any')
url="http://search.cpan.org/~miyagawa/$_perlmod-v$pkgver/"
license=('GPL' 'PerlArtistic')
depends=(
  'perl-cpan-meta'
  'perl-exception-class'
  'perl-file-pushd'
  'perl-json'
  'perl-try-tiny'
  'perl-moo'
  'perl-path-tiny'
  'perl-module-cpanfile'
  'perl-module-reader'
  'cpanminus'
  'perl-app-fatpacker>=0.009018'
)
makedepends=('perl-module-build')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/$_perlmod-v$pkgver.tar.gz")
md5sums=('c3b753736f62e7094bf1585244b1f4dd')

build() {
  cd "$srcdir/$_perlmod-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

package() {
  cd "$srcdir/$_perlmod-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="$pkgdir"
}
