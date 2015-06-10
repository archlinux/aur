# Maintainer: Peter Lamby <peterlamby at web dot de>
pkgname=mtaws
pkgver=1.120
pkgrel=2
pkgdesc='Perl Multithreaded Multipart sync to Amazon Glacier'
_dist=App-MtAws
arch=('any')
url="http://mt-aws.com/"
license=('GPL3')
depends=('perl' 'perl-json-xs' 'perl-libwww')
optdepends=('perl-lwp-protocol-https: HTTPS support')
makedepends=('perl-datetime')
checkdepends=('perl-test-tabs' 'perl-test-deep' 'perl-test-mockmodule' 'perl-test-spec')
options=('!emptydirs' purge)
source=("http://www.cpan.org/modules/by-module/App/App-MtAws-$pkgver.tar.gz")
sha256sums=('1f52d822975b646ed9eb80edff859f260acd82cfb9b3fec833556e36664afc33')
md5sums=('c4d0a6e488129abd0390bb5bd2a42bb1')

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
	./Build install installdirs=vendor destdir="$pkgdir"
)
