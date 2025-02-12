# Maintainer: dringsim <dringsim@qq.com>
pkgname=iperl
pkgver=0.012
pkgrel=1
pkgdesc='Perl language kernel for Jupyter'
_dist=Devel-IPerl
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-b-keywords' 'perl-capture-tiny' 'perl-digest-sha' 'perl-env' 'perl-file-copy-recursive'
	'perl-file-sharedir' 'perl-pathtools' 'perl-findbin' 'perl-getopt-long' 'perl-html-fromansi'
	'perl-io-async' 'perl-io' 'perl-json-maybexs' 'perl-libwww' 'perl-list-allutils' 'perl-log-any'
	'perl-mime-base64' 'perl-markdown-pod' 'perl-moo' 'perl-moox-handlesvia' 'perl-moox-singleton'
	'perl-moox-types-mooselike' 'perl-moosex-handlesconstructor' 'perl-net-async-zmq' 'perl-ppi'
	'perl-path-class' 'perl-reply' 'perl-scalar-list-utils' 'perl-try-tiny' 'perl-uuid-tiny' 'perl-zmq-ffi'
	'perl-autodie' 'perl-base' 'perl-constant' 'perl-if' 'perl-namespace-autoclean' 'jupyterlab')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/Z/ZM/ZMUGHAL/$_dist-$pkgver.tar.gz")
sha256sums=('523332856029189dda23742856e677dd998995e4f94233434deb1baa3e29b86a')

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
